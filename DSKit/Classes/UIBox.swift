//
//  DSKit.swift
//  DSKit
//
//  Created by Nemi Shah on 04/12/22.
//

import SwiftUI

public struct UIBoxConfig {
    let containerStyle: UIBoxContainerConfig
    let cornerRadius: CGFloat
    let buttonStyle: UIBoxButtonConfig
    let appTheme: UIBoxAppTheme
    
    public init(
        containerStyle: UIBoxContainerConfig = _defaultContainerStyle,
        cornerRadius: CGFloat = UIBoxCommonCornerRadius.DEFAULT_RADIUS,
        buttonStyle: UIBoxButtonConfig = _defaultButtonConfig,
        appTheme: UIBoxAppTheme = _defaultAppTheme
    ) {
        self.containerStyle = containerStyle
        self.cornerRadius = cornerRadius
        self.buttonStyle = buttonStyle
        self.appTheme = appTheme
    }
}

public class UIBox {
    private static var _instance: UIBox? = nil
    private static var _defaultInstance: UIBox = UIBox(
        config: UIBoxConfig()
    )
    
    internal static func getInstance() -> UIBox {
        return _instance ?? _defaultInstance
    }
    
    private let config: UIBoxConfig
    
    private init(config: UIBoxConfig) {
        self.config = config
    }
    
    public static func initialise(
        config: UIBoxConfig = UIBoxConfig()
    ) -> Void {
        if UIBox._instance != nil {
           print("DSKit has already been initialised, ignoring call to `initialise`")
        } else {
            UIBox._instance = UIBox(
                config: config
            )
        }
    }
    
    func getConfig() -> UIBoxConfig {
        return config
    }
}
