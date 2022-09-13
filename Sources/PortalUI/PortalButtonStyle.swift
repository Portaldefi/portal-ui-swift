//
//  PortalButtonStyle.swift
//  
//
//  Created by farid on 8/2/22.
//

import SwiftUI

public struct PortalButtonStyle: ButtonStyle {
    private let style: PButton.Style
    private let size: PButton.Size
    private let color: Color?
    private let enabled: Bool
    
    private var padding: CGFloat {
        switch size {
        case .small: return 4
        case .medium: return 8
        case .big: return 12
        }
    }
    
    private var fontSize: CGFloat {
        switch size {
        case .small, .medium: return 16
        case .big: return 22
        }
    }
    
    private var foregroundColor: Color {
        switch style {
        case .filled:
            return Color(red: 10/255, green: 10/255, blue: 10/255, opacity: 1)
        case .outline:
            return Color(red: 234/255, green: 234/255, blue: 234/255, opacity: 1)
        case .free:
            if let color = color {
                return color
            }
            return Color(red: 234/255, green: 234/255, blue: 234/255, opacity: 1)
        }
    }
    
    private var height: CGFloat {
        switch size {
        case .small: return 30
        case .medium: return 40
        case .big: return 60
        }
    }
    
    private var cornerRadius: CGFloat {
        switch size {
        case .small: return 10
        case .medium: return 12
        case .big: return 16
        }
    }
    
    public init(style: PButton.Style, size: PButton.Size, color: Color?, enabled: Bool) {
        self.style = style
        self.size = size
        self.color = color
        self.enabled = enabled
    }
        
    public func makeBody(configuration: Self.Configuration) -> some View {
        switch style {
        case .filled:
            configuration.label
                .frame(maxWidth: .infinity)
                .frame(height: height)
                .font(.Main.fixed(.bold, size: fontSize))
                .foregroundColor(foregroundColor.opacity(configuration.isPressed ? 0.8 : 1).opacity(enabled ? 1 : 0.6))
                .background(RadialGradient.main.opacity(configuration.isPressed ? 0.8 : 1).opacity(enabled ? 1 : 0.6))
                .cornerRadius(cornerRadius)
                .scaleEffect(configuration.isPressed ? 0.99 : 1.0)
        case .outline:
            configuration.label
                .frame(maxWidth: .infinity)
                .frame(height: height)
                .font(.Main.fixed(.bold, size: fontSize))
                .foregroundColor(foregroundColor.opacity(configuration.isPressed ? 0.8 : 1).opacity(enabled ? 1 : 0.6))
                .overlay(
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(RadialGradient.main, lineWidth: 2)
                        .opacity(configuration.isPressed ? 0.8 : 1)
                )
                .scaleEffect(configuration.isPressed ? 0.99 : 1.0)
        case .free:
            configuration.label
                .frame(maxWidth: .infinity)
                .frame(height: height)
                .font(.Main.fixed(.bold, size: fontSize))
                .foregroundColor(foregroundColor.opacity(configuration.isPressed ? 0.8 : 1).opacity(enabled ? 1 : 0.6))
                .scaleEffect(configuration.isPressed ? 0.99 : 1.0)
        }
    }
}

