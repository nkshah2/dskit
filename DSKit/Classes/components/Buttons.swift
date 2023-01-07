//
//  Buttons.swift
//  DSKit
//
//  Created by Nemi Shah on 04/12/22.
//

import SwiftUI

public struct DSKitButtonConfig {
    public static let DEFAULT_TEXT_COLOR: Color = Color.white
    public static let DEFAULT_ACTIVE_OPACITY: Double = 0.3
    
    let standardButtonStyle: DSKitStandardButtonConfig
    let circularButtonStyle: DSKitCircularButtonConfig
    let fullWidthButtonStyle: DSKitStandardButtonConfig
    let activeOpacity: Double
    
    public init(
        standardButtonStyle: DSKitStandardButtonConfig = _defaultStandardButtonStyle,
        circularButtonStyle: DSKitCircularButtonConfig = _defaultCircularButtonStyle,
        fullWidthButtonStyle: DSKitStandardButtonConfig = _defaultFullWidthButtonStyle,
        activeOpacity: Double = DSKitButtonConfig.DEFAULT_ACTIVE_OPACITY
    ) {
        self.standardButtonStyle = standardButtonStyle
        self.circularButtonStyle = circularButtonStyle
        self.fullWidthButtonStyle = fullWidthButtonStyle
        self.activeOpacity = activeOpacity
    }
}

public struct DSKitStandardButtonConfig {
    let verticalPadding: CGFloat
    let horizontalPadding: CGFloat
    
    public init(verticalPadding: CGFloat, horizontalPadding: CGFloat) {
        self.verticalPadding = verticalPadding
        self.horizontalPadding = horizontalPadding
    }
}

public struct DSKitCircularButtonConfig {
    let padding: CGFloat
    
    public init(padding: CGFloat) {
        self.padding = padding
    }
}

public let _defaultStandardButtonStyle = DSKitStandardButtonConfig(verticalPadding: 6, horizontalPadding: 10)
public let _defaultFullWidthButtonStyle = DSKitStandardButtonConfig(verticalPadding: 12, horizontalPadding: 16)
public let _defaultCircularButtonStyle = DSKitCircularButtonConfig(padding: 8)
public let _defaultButtonConfig = DSKitButtonConfig()

public struct FullWidthButtonStyle: ButtonStyle {
    public init() {}
    
    public func makeBody(configuration: Configuration) -> some View {
        let config = DSKit.getInstance().getConfig()
        let opacity: Double = getButtonOpacity(isPressed: configuration.isPressed)
        
        return configuration.label
            .modifier(FullWidth())
            .padding(.vertical, config.buttonStyle.fullWidthButtonStyle.verticalPadding)
            .padding(.horizontal, config.buttonStyle.fullWidthButtonStyle.horizontalPadding)
            .background(config.appTheme.accentColor.opacity(opacity))
            .foregroundColor(config.appTheme.textOnAccentColor)
            .modifier(CommonCornerRadius())
    }
}

public struct CircularButtonStyle: ButtonStyle {
    let size: CGFloat
    
    public init(size: CGFloat) {
        self.size = size
    }
    
    public func makeBody(configuration: Configuration) -> some View {
        let config = DSKit.getInstance().getConfig()
        let opacity: Double = getButtonOpacity(isPressed: configuration.isPressed)
        
        return configuration.label
            .frame(width: size, height: size, alignment: .center)
            .padding(.vertical, config.buttonStyle.circularButtonStyle.padding)
            .padding(.horizontal, config.buttonStyle.circularButtonStyle.padding)
            .background(config.appTheme.accentColor.opacity(opacity))
            .foregroundColor(config.appTheme.textOnAccentColor)
            .clipShape(Circle())
        
    }
}

public struct StandardButtonStyle: ButtonStyle {
    public init() {}
    
    public func makeBody(configuration: Configuration) -> some View {
        let config = DSKit.getInstance().getConfig()
        let opacity: Double = getButtonOpacity(isPressed: configuration.isPressed)
        
        return configuration.label
            .padding(.vertical, config.buttonStyle.standardButtonStyle.verticalPadding)
            .padding(.horizontal, config.buttonStyle.standardButtonStyle.horizontalPadding)
            .background(config.appTheme.accentColor.opacity(opacity))
            .foregroundColor(config.appTheme.textOnAccentColor)
            .modifier(CommonCornerRadius())
    }
}

internal func getButtonOpacity(isPressed: Bool) -> Double {
    return isPressed ? DSKit.getInstance().getConfig().buttonStyle.activeOpacity : 1
}

