//
//  RadialGradient+Extension.swift
//  
//
//  Created by farid on 9/13/22.
//

import SwiftUI

public extension RadialGradient {
    static var main: RadialGradient {
        RadialGradient(
            colors: [
                Palette.gradientLeadingColor,
                Palette.gradientTrailingColor
            ],
            center: .bottomTrailing,
            startRadius: 0,
            endRadius: 270
        )
    }
    
    static var buttons: RadialGradient {
        RadialGradient(
            colors: [
                Palette.gradientLeadingColor,
                Palette.gradientTrailingColor
            ],
            center: .bottomTrailing,
            startRadius: 180,
            endRadius: 270
        )
    }
}
