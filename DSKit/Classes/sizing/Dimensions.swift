//
//  Dimensions.swift
//  DSKit
//
//  Created by Nemi Shah on 09/12/22.
//

import SwiftUI

public struct UIBoxFullWidth: ViewModifier {
    public init() {}
    
    public func body(content: Content) -> some View {
        content
            .frame(minWidth: 0, maxWidth: .infinity)
    }
}

public struct UIBoxFullHeight: ViewModifier {
    public init() {}
    
    public func body(content: Content) -> some View {
        content
            .frame(minHeight: 0, maxHeight: .infinity)
    }
}
