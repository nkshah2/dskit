//
//  ContentView.swift
//  DSKit-Example
//
//  Created by Nemi Shah on 04/12/22.
//

import SwiftUI
import DSKit

struct ContentView: View {
    init() {
        DSKit.initialise()
    }
    
    var body: some View {
        NavigationView {
            VStack() {
                DSKitAsyncImage(url: "https://www.shutterstock.com/image-vector/cosmic-background-alien-planet-deserted-260nw-1968007051.jpg", contentMode: .fit)
            }
            .screenContainer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
