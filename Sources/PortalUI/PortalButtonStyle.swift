//
//  PortalButtonStyle.swift
//  
//
//  Created by farid on 8/2/22.
//

import SwiftUI

public struct PortalButtonStyle: ButtonStyle {
    let style: PButton.Style
    let size: PButton.Size
    let enabled: Bool
    
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
        case .outline, .free:
            return Color(red: 234/255, green: 234/255, blue: 234/255, opacity: 1)
        }
    }
    
    private var backgroundColor: Color {
        switch style {
        case .filled:
            return .blue
        case .outline, .free:
            return .clear
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
        
    public func makeBody(configuration: Self.Configuration) -> some View {
        switch style {
        case .filled:
            configuration.label
                .frame(maxWidth: .infinity)
                .frame(height: height)
                .font(.system(size: fontSize, design: .monospaced))
                .foregroundColor(foregroundColor.opacity(configuration.isPressed ? 0.8 : 1))
                .background(backgroundColor.opacity(configuration.isPressed ? 0.8 : 1))
                .cornerRadius(cornerRadius)
                .scaleEffect(configuration.isPressed ? 0.99 : 1.0)
        case .outline:
            configuration.label
                .frame(maxWidth: .infinity)
                .frame(height: height)
                .font(.system(size: fontSize, design: .monospaced))
                .foregroundColor(foregroundColor.opacity(configuration.isPressed ? 0.8 : 1))
                .background(backgroundColor.opacity(configuration.isPressed ? 0.8 : 1))
                .overlay(
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(Color.blue, lineWidth: 3)
                        .opacity(configuration.isPressed ? 0.8 : 1)
                )
                .scaleEffect(configuration.isPressed ? 0.99 : 1.0)
        case .free:
            configuration.label
                .frame(maxWidth: .infinity)
                .frame(height: height)
                .font(.system(size: fontSize, design: .monospaced))
                .foregroundColor(foregroundColor.opacity(configuration.isPressed ? 0.8 : 1))
                .background(backgroundColor)
                .scaleEffect(configuration.isPressed ? 0.99 : 1.0)
        }
    }
}

