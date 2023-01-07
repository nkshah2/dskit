//
//  Containers.swift
//  DSKit
//
//  Created by Nemi Shah on 09/12/22.
//

import SwiftUI

public struct DSKitScreenStyle {
    let verticalPadding: CGFloat
    let horizontalPadding: CGFloat
    let backgroundColor: Color
    
    public init(
        verticalPadding: CGFloat = ScreenContainer.DEFAULT_PADDING,
        horizontalPadding: CGFloat = ScreenContainer.DEFAULT_PADDING,
        backgroundColor: Color = ScreenContainer.DEFAULT_BACKGROUND
    ) {
        self.verticalPadding = verticalPadding
        self.horizontalPadding = horizontalPadding
        self.backgroundColor = backgroundColor
    }
}

public let _defaultScreenStyle = DSKitScreenStyle(
    verticalPadding: ScreenContainer.DEFAULT_PADDING,
    horizontalPadding: ScreenContainer.DEFAULT_PADDING,
    backgroundColor: ScreenContainer.DEFAULT_BACKGROUND
)

public struct DSKitContainerConfig {
    let screenStyle: DSKitScreenStyle
    
    public init(screenStyle: DSKitScreenStyle = _defaultScreenStyle) {
        self.screenStyle = screenStyle
    }
}

public let _defaultContainerStyle = DSKitContainerConfig()

public struct ScreenContainer: ViewModifier {
    public static let DEFAULT_PADDING: CGFloat = 12
    public static let DEFAULT_BACKGROUND = Color.white
    
    let horizontalPadding: CGFloat
    let verticalPadding: CGFloat
    let backgroundColor: Color
    
    public init(
        horizontalPadding: CGFloat = ScreenContainer.DEFAULT_PADDING,
        verticalPadding: CGFloat = ScreenContainer.DEFAULT_PADDING,
        backgroundColor: Color = ScreenContainer.DEFAULT_BACKGROUND
    ) {
        self.horizontalPadding = horizontalPadding
        self.verticalPadding = verticalPadding
        self.backgroundColor = backgroundColor
    }
    
    public func body(content: Content) -> some View {
        let config = DSKit.getInstance().getConfig().containerStyle.screenStyle
        
        return content
            .modifier(FullWidth())
            .modifier(FullHeight())
            .padding(.vertical, config.verticalPadding)
            .padding(.horizontal, config.horizontalPadding)
            .background(config.backgroundColor.ignoresSafeArea(.all))
    }
}
