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
                Button(action: {
                    
                }) {
                    Text("Testing")
                }
                .standard()
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
