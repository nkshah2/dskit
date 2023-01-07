//
//  Colors.swift
//  DSKit
//
//  Created by Nemi Shah on 01/01/23.
//

import SwiftUI

public struct AppTheme {
    let accentColor: Color
    let textOnAccentColor: Color
    
    public init(accentColor: Color = Color.blue, textOnAccentColor: Color = Color.white) {
        self.accentColor = accentColor
        self.textOnAccentColor = textOnAccentColor
    }
}

public let _defaultAppTheme: AppTheme = AppTheme(accentColor: Color.blue, textOnAccentColor: Color.white)
