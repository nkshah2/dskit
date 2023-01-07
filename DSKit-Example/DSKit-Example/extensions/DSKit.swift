//
//  DSKit.swift
//  DSKit-Example
//
//  Created by Nemi Shah on 09/12/22.
//

import SwiftUI
import DSKit

extension View {
    func fullWidth() -> some View {
        modifier(FullWidth())
    }
    
    func fullHeight() -> some View {
        modifier(FullHeight())
    }
    
    func screenContainer() -> some View {
        modifier(ScreenContainer())
    }
    
    func curvedCorners() -> some View {
        modifier(CommonCornerRadius())
    }
}

extension Button {
    func fullWidthButton() -> some View {
        buttonStyle(FullWidthButtonStyle())
    }
    
    func circularButton(size: CGFloat) -> some View {
        buttonStyle(CircularButtonStyle(size: size))
    }
    
    func standard() -> some View {
        buttonStyle(StandardButtonStyle())
    }
}
