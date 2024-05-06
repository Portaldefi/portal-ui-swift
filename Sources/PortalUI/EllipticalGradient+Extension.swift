//
//  RadialGradient+Extension.swift
//  
//
//  Created by farid on 9/13/22.
//

import SwiftUI

public extension EllipticalGradient {
    static var main: EllipticalGradient {
        EllipticalGradient(
            stops: [
                Gradient.Stop(color: Color(red: 0.47, green: 0.25, blue: 0.94), location: 0.45),
                Gradient.Stop(color: Color(red: 0.88, green: 0.13, blue: 1), location: 1.00),
            ],
            center: .bottomLeading,
            startRadiusFraction: 0,
            endRadiusFraction: 1
        )
    }
}
