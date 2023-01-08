//
//  Buttons.swift
//  DSKit
//
//  Created by Nemi Shah on 04/12/22.
//

import SwiftUI

public struct UIBoxButtonConfig {
    public static let DEFAULT_TEXT_COLOR: Color = Color.white
    public static let DEFAULT_ACTIVE_OPACITY: Double = 0.3
    
    let standardButtonStyle: UIBoxStandardButtonConfig
    let circularButtonStyle: UIBoxCircularButtonConfig
    let fullWidthButtonStyle: UIBoxStandardButtonConfig
    let activeOpacity: Double
    
    public init(
        standardButtonStyle: UIBoxStandardButtonConfig = _defaultStandardButtonStyle,
        circularButtonStyle: UIBoxCircularButtonConfig = _defaultCircularButtonStyle,
        fullWidthButtonStyle: UIBoxStandardButtonConfig = _defaultFullWidthButtonStyle,
        activeOpacity: Double = UIBoxButtonConfig.DEFAULT_ACTIVE_OPACITY
    ) {
        self.standardButtonStyle = standardButtonStyle
        self.circularButtonStyle = circularButtonStyle
        self.fullWidthButtonStyle = fullWidthButtonStyle
        self.activeOpacity = activeOpacity
    }
}

public struct UIBoxStandardButtonConfig {
    let verticalPadding: CGFloat
    let horizontalPadding: CGFloat
    
    public init(verticalPadding: CGFloat, horizontalPadding: CGFloat) {
        self.verticalPadding = verticalPadding
        self.horizontalPadding = horizontalPadding
    }
}

public struct UIBoxCircularButtonConfig {
    let padding: CGFloat
    
    public init(padding: CGFloat) {
        self.padding = padding
    }
}

public let _defaultStandardButtonStyle = UIBoxStandardButtonConfig(verticalPadding: 6, horizontalPadding: 10)
public let _defaultFullWidthButtonStyle = UIBoxStandardButtonConfig(verticalPadding: 12, horizontalPadding: 16)
public let _defaultCircularButtonStyle = UIBoxCircularButtonConfig(padding: 8)
public let _defaultButtonConfig = UIBoxButtonConfig()

public struct FullWidthButtonStyle: ButtonStyle {
    public init() {}
    
    public func makeBody(configuration: Configuration) -> some View {
        let config = UIBox.getInstance().getConfig()
        let opacity: Double = getButtonOpacity(isPressed: configuration.isPressed)
        
        return configuration.label
            .modifier(UIBoxFullWidth())
            .padding(.vertical, config.buttonStyle.fullWidthButtonStyle.verticalPadding)
            .padding(.horizontal, config.buttonStyle.fullWidthButtonStyle.horizontalPadding)
            .background(config.appTheme.accentColor.opacity(opacity))
            .foregroundColor(config.appTheme.textOnAccentColor)
            .modifier(UIBoxCommonCornerRadius())
    }
}

public struct CircularButtonStyle: ButtonStyle {
    let size: CGFloat
    
    public init(size: CGFloat) {
        self.size = size
    }
    
    public func makeBody(configuration: Configuration) -> some View {
        let config = UIBox.getInstance().getConfig()
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
        let config = UIBox.getInstance().getConfig()
        let opacity: Double = getButtonOpacity(isPressed: configuration.isPressed)
        
        return configuration.label
            .padding(.vertical, config.buttonStyle.standardButtonStyle.verticalPadding)
            .padding(.horizontal, config.buttonStyle.standardButtonStyle.horizontalPadding)
            .background(config.appTheme.accentColor.opacity(opacity))
            .foregroundColor(config.appTheme.textOnAccentColor)
            .modifier(UIBoxCommonCornerRadius())
    }
}

internal func getButtonOpacity(isPressed: Bool) -> Double {
    return isPressed ? UIBox.getInstance().getConfig().buttonStyle.activeOpacity : 1
}

