//
//  General.swift
//  DSKit
//
//  Created by Nemi Shah on 09/12/22.
//

import SwiftUI

public struct CommonCornerRadius: ViewModifier {
    public static let DEFAULT_RADIUS: CGFloat = 12
    
    private let cornerRadius: CGFloat
    
    public init(cornerRadius: CGFloat = CommonCornerRadius.DEFAULT_RADIUS) {
        self.cornerRadius = cornerRadius
    }
    
    public func body(content: Content) -> some View {
        return content
            .cornerRadius(DSKit.getInstance().getConfig().cornerRadius)
    }
}
