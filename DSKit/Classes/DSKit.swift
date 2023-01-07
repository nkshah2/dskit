//
//  DSKit.swift
//  DSKit
//
//  Created by Nemi Shah on 04/12/22.
//

import SwiftUI

public struct DSKitConfig {
    let containerStyle: DSKitContainerConfig
    let cornerRadius: CGFloat
    let buttonStyle: DSKitButtonConfig
    let appTheme: AppTheme
    
    public init(
        containerStyle: DSKitContainerConfig = _defaultContainerStyle,
        cornerRadius: CGFloat = CommonCornerRadius.DEFAULT_RADIUS,
        buttonStyle: DSKitButtonConfig = _defaultButtonConfig,
        appTheme: AppTheme = _defaultAppTheme
    ) {
        self.containerStyle = containerStyle
        self.cornerRadius = cornerRadius
        self.buttonStyle = buttonStyle
        self.appTheme = appTheme
    }
}

public class DSKit {
    private static var _instance: DSKit? = nil
    private static var _defaultInstance: DSKit = DSKit(
        config: DSKitConfig()
    )
    
    internal static func getInstance() -> DSKit {
        return _instance ?? _defaultInstance
    }
    
    private let config: DSKitConfig
    
    private init(config: DSKitConfig) {
        self.config = config
    }
    
    public static func initialise(
        config: DSKitConfig = DSKitConfig()
    ) -> Void {
        if DSKit._instance != nil {
           print("DSKit has already been initialised, ignoring call to `initialise`")
        } else {
            DSKit._instance = DSKit(
                config: config
            )
        }
    }
    
    func getConfig() -> DSKitConfig {
        return config
    }
}
