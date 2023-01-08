//
//  Containers.swift
//  DSKit
//
//  Created by Nemi Shah on 09/12/22.
//

import SwiftUI

public struct UIBoxScreenStyle {
    let verticalPadding: CGFloat
    let horizontalPadding: CGFloat
    let backgroundColor: Color
    
    public init(
        verticalPadding: CGFloat = UIBoxScreenContainer.DEFAULT_PADDING,
        horizontalPadding: CGFloat = UIBoxScreenContainer.DEFAULT_PADDING,
        backgroundColor: Color = UIBoxScreenContainer.DEFAULT_BACKGROUND
    ) {
        self.verticalPadding = verticalPadding
        self.horizontalPadding = horizontalPadding
        self.backgroundColor = backgroundColor
    }
}

public let _defaultScreenStyle = UIBoxScreenStyle(
    verticalPadding: UIBoxScreenContainer.DEFAULT_PADDING,
    horizontalPadding: UIBoxScreenContainer.DEFAULT_PADDING,
    backgroundColor: UIBoxScreenContainer.DEFAULT_BACKGROUND
)

public struct UIBoxContainerConfig {
    let screenStyle: UIBoxScreenStyle
    
    public init(screenStyle: UIBoxScreenStyle = _defaultScreenStyle) {
        self.screenStyle = screenStyle
    }
}

public let _defaultContainerStyle = UIBoxContainerConfig()

public struct UIBoxScreenContainer: ViewModifier {
    public static let DEFAULT_PADDING: CGFloat = 12
    public static let DEFAULT_BACKGROUND = Color.white
    
    let horizontalPadding: CGFloat
    let verticalPadding: CGFloat
    let backgroundColor: Color
    
    public init(
        horizontalPadding: CGFloat = UIBoxScreenContainer.DEFAULT_PADDING,
        verticalPadding: CGFloat = UIBoxScreenContainer.DEFAULT_PADDING,
        backgroundColor: Color = UIBoxScreenContainer.DEFAULT_BACKGROUND
    ) {
        self.horizontalPadding = horizontalPadding
        self.verticalPadding = verticalPadding
        self.backgroundColor = backgroundColor
    }
    
    public func body(content: Content) -> some View {
        let config = UIBox.getInstance().getConfig().containerStyle.screenStyle
        
        return content
            .modifier(UIBoxFullWidth())
            .modifier(UIBoxFullHeight())
            .padding(.vertical, config.verticalPadding)
            .padding(.horizontal, config.horizontalPadding)
            .background(config.backgroundColor.ignoresSafeArea(.all))
    }
}
