//
//  Images.swift
//  DSKit
//
//  Created by Nemi Shah on 07/01/23.
//

import SwiftUI

internal class ImageLoaderService: ObservableObject {
    @Published var data: (UIImage?, Error?) = (nil, nil)
    
    func loadImage(for urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                self.data = (nil, error)
                return
            }
            DispatchQueue.main.async {
                self.data = (UIImage(data: data), error)
            }
        }
        task.resume()
    }
    
}

public struct UIBoxAsyncImage: View {
    @ObservedObject var imageLoader = ImageLoaderService()
    @State var image: UIImage = UIImage()
    
    var url: String
    var contentMode: ContentMode
    var onError: ((Error) -> Void)?
    
    public init(url: String, contentMode: ContentMode = .fit, onError: ((Error) -> Void)? = nil) {
        self.url = url
        self.contentMode = contentMode
        self.onError = onError
    }
    
    public var body: some View {
        Image(uiImage: image)
            .resizable()
            .aspectRatio(contentMode: contentMode)
            .onReceive(imageLoader.$data) { data in
                if data.0 != nil {
                    self.image = data.0!
                } else if data.1 != nil && self.onError != nil {
                    self.onError!(data.1!)
                }
            }
            .onAppear {
                imageLoader.loadImage(for: url)
            }
    }
}
