//
//  PButton.swift
//  
//
//  Created by farid on 8/2/22.
//

import SwiftUI

public struct PButton: View {
    private let config: Config
    private let style: Style
    private let size: Size
    private let enabled: Bool
    private let action: () -> Void
    
    public enum Style {
        case filled, outline, free
    }
    
    public enum Config {
        case onlyLabel(String),
             onlyIcon(String),
             labelAndIconLeft(label: String, icon: String),
             labelAndIconRight(label: String, icon: String)
    }
    
    public enum Size {
        case small, medium, big
    }
    
    private var iconSize: CGFloat {
        switch size {
        case .small: return 14.67
        case .medium: return 19.07
        case .big: return 22
        }
    }
    
    private var fontWeight: Font.Weight {
        switch size {
        case .small, .medium: return .semibold
        case .big: return .bold
        }
    }
    
    private var stackSpacing: CGFloat {
        switch size {
        case .small: return 8.67
        case .medium: return 9.74
        case .big: return 10
        }
    }
    
    public init(config: Config, style: Style, size: Size, enabled: Bool, action: @escaping () -> Void) {
        self.config = config
        self.style = style
        self.size = size
        self.enabled = enabled
        self.action = action
    }
            
    public var body: some View {
        Button(action: {
            action()
        }) {
            switch config {
            case .onlyLabel(let label):
                Text(label)
                    .fontWeight(fontWeight)
            case .onlyIcon(let icon):
                Image(systemName: icon)
                    .resizable()
                    .frame(width: iconSize, height: iconSize)
            case .labelAndIconLeft(let label, let icon):
                HStack(spacing: stackSpacing) {
                    Image(systemName: icon)
                        .resizable()
                        .frame(width: iconSize, height: iconSize)
                    Text(label)
                        .fontWeight(fontWeight)
                }
            case .labelAndIconRight(let label, let icon):
                HStack(spacing: stackSpacing) {
                    Text(label)
                        .fontWeight(fontWeight)
                    Image(systemName: icon)
                        .resizable()
                        .frame(width: iconSize, height: iconSize)
                }
            }
        }
        .buttonStyle(PortalButtonStyle(style: style, size: size, enabled: enabled))
        .disabled(!enabled)
    }
}

struct PButton_Previews_OnlyIcon: PreviewProvider {
    static var previews: some View {
        Group {
            //free
            PButton(config: .onlyIcon("brain"), style: .free, size: .small, enabled: true, action: {})
                .previewDisplayName("Style: free, size: small, enabled: true")
                .frame(width: 30)
            
            PButton(config: .onlyIcon("brain"), style: .free, size: .medium, enabled: true, action: {})
                .previewDisplayName("Style: free, size: medium, enabled: true")
                .frame(width: 40)
            
            PButton(config: .onlyIcon("brain"), style: .free, size: .big, enabled: true, action: {})
                .previewDisplayName("Style: free, size: big, enabled: true")
                .frame(width: 60)
            //outline
            PButton(config: .onlyIcon("brain"), style: .outline, size: .small, enabled: true, action: {})
                .previewDisplayName("Style: outline, size: small, enabled: true")
                .frame(width: 30)
                .padding()
            
            PButton(config: .onlyIcon("brain"), style: .outline, size: .medium, enabled: true, action: {})
                .previewDisplayName("Style: outline, size: medium, enabled: true")
                .frame(width: 40)
                .padding()
            
            PButton(config: .onlyIcon("brain"), style: .outline, size: .big, enabled: true, action: {})
                .previewDisplayName("Style: outline, size: big, enabled: true")
                .frame(width: 60)
                .padding()
            //filled
            PButton(config: .onlyIcon("brain"), style: .filled, size: .small, enabled: true, action: {})
                .previewDisplayName("Style: filled, size: small, enabled: true")
                .frame(width: 30)
                .padding()
            
            PButton(config: .onlyIcon("brain"), style: .filled, size: .medium, enabled: true, action: {})
                .previewDisplayName("Style: filled, size: medium, enabled: true")
                .frame(width: 40)
                .padding()
            
            PButton(config: .onlyIcon("brain"), style: .filled, size: .big, enabled: true, action: {})
                .previewDisplayName("Style: filled, size: big, enabled: true")
                .frame(width: 60)
                .padding()
        }
        .previewLayout(PreviewLayout.sizeThatFits)
        .background(Color(red: 58/255, green: 58/255, blue: 58/255, opacity: 1))
    }
}

struct PButton_Previews_OnlyLabel: PreviewProvider {
    static var previews: some View {
        Group {
            //free
            Group {
                PButton(config: .onlyLabel("Portal button"), style: .free, size: .small, enabled: true, action: {})
                    .previewDisplayName("Style: free, size: small, enabled: true")
                    .frame(width: 150)
                PButton(config: .onlyLabel("Portal button"), style: .free, size: .medium, enabled: true, action: {})
                    .previewDisplayName("Style: free, size: medium, enabled: true")
                    .frame(width: 150)
                PButton(config: .onlyLabel("Portal button"), style: .free, size: .big, enabled: true, action: {})
                    .previewDisplayName("Style: free, size: big, enabled: true")
                    .frame(width: 200)
            }
            //outline
            Group {
                PButton(config: .onlyLabel("Portal button"), style: .outline, size: .small, enabled: true, action: {})
                    .previewDisplayName("Style: outlined, size: small, enabled: true")
                    .frame(width: 160)
                    .padding()
                PButton(config: .onlyLabel("Portal button"), style: .outline, size: .medium, enabled: true, action: {})
                    .previewDisplayName("Style: outlined, size: medium, enabled: true")
                    .frame(width: 160)
                    .padding()
                PButton(config: .onlyLabel("Portal button"), style: .outline, size: .big, enabled: true, action: {})
                    .previewDisplayName("Style: outlined, size: big, enabled: true")
                    .frame(width: 215)
                    .padding()
            }
            //filled
            Group {
                PButton(config: .onlyLabel("Portal button"), style: .filled, size: .small, enabled: true, action: {})
                    .previewDisplayName("Style: filled, size: small, enabled: true")
                    .frame(width: 160)
                    .padding()
                PButton(config: .onlyLabel("Portal button"), style: .filled, size: .medium, enabled: true, action: {})
                    .previewDisplayName("Style: filled, size: medium, enabled: true")
                    .frame(width: 160)
                    .padding()
                PButton(config: .onlyLabel("Portal button"), style: .filled, size: .big, enabled: true, action: {})
                    .previewDisplayName("Style: filled, size: big, enabled: true")
                    .frame(width: 215)
                    .padding()
            }
        }
        .previewLayout(PreviewLayout.sizeThatFits)
        .background(Color(red: 58/255, green: 58/255, blue: 58/255, opacity: 1))
    }
}

struct PButton_Previews_LabelAndIconLeft: PreviewProvider {
    static var previews: some View {
        Group {
            //free
            PButton(config: .labelAndIconLeft(label: "Portal button", icon: "brain"), style: .free, size: .small, enabled: true, action: {})
                .previewDisplayName("Style: free, size: small, enabled: true")
                .frame(width: 200)
            PButton(config: .labelAndIconLeft(label: "Portal button", icon: "brain"), style: .free, size: .medium, enabled: true, action: {})
                .previewDisplayName("Style: free, size: medium, enabled: true")
                .frame(width: 200)
            PButton(config: .labelAndIconLeft(label: "Portal button", icon: "brain"), style: .free, size: .big, enabled: true, action: {})
                .previewDisplayName("Style: free, size: big, enabled: true")
                .frame(width: 250)
            //outlined
            PButton(config: .labelAndIconLeft(label: "Portal button", icon: "brain"), style: .outline, size: .small, enabled: true, action: {})
                .previewDisplayName("Style: outlined, size: small, enabled: true")
                .frame(width: 200)
                .padding()
            PButton(config: .labelAndIconLeft(label: "Portal button", icon: "brain"), style: .outline, size: .medium, enabled: true, action: {})
                .previewDisplayName("Style: outlined, size: medium, enabled: true")
                .frame(width: 200)
                .padding()
            PButton(config: .labelAndIconLeft(label: "Portal button", icon: "brain"), style: .outline, size: .big, enabled: true, action: {})
                .previewDisplayName("Style: outlined, size: big, enabled: true")
                .frame(width: 250)
                .padding()
            //filled
            PButton(config: .labelAndIconLeft(label: "Portal button", icon: "brain"), style: .filled, size: .small, enabled: true, action: {})
                .previewDisplayName("Style: filled, size: small, enabled: true")
                .frame(width: 200)
                .padding()
            PButton(config: .labelAndIconLeft(label: "Portal button", icon: "brain"), style: .filled, size: .medium, enabled: true, action: {})
                .previewDisplayName("Style: filled, size: medium, enabled: true")
                .frame(width: 200)
                .padding()
            PButton(config: .labelAndIconLeft(label: "Portal button", icon: "brain"), style: .filled, size: .big, enabled: true, action: {})
                .previewDisplayName("Style: filled, size: big, enabled: true")
                .frame(width: 250)
                .padding()
        }
        .previewLayout(PreviewLayout.sizeThatFits)
        .background(Color(red: 58/255, green: 58/255, blue: 58/255, opacity: 1))
    }
}

struct PButton_Previews_LabelAndIconRight: PreviewProvider {
    static var previews: some View {
        Group {
            //free
            PButton(config: .labelAndIconRight(label: "Portal button", icon: "brain"), style: .free, size: .small, enabled: true, action: {})
                .previewDisplayName("Style: free, size: small, enabled: true")
                .frame(width: 200)
            PButton(config: .labelAndIconRight(label: "Portal button", icon: "brain"), style: .free, size: .medium, enabled: true, action: {})
                .previewDisplayName("Style: free, size: medium, enabled: true")
                .frame(width: 200)
            PButton(config: .labelAndIconRight(label: "Portal button", icon: "brain"), style: .free, size: .big, enabled: true, action: {})
                .previewDisplayName("Style: free, size: big, enabled: true")
                .frame(width: 250)
            //outlined
            PButton(config: .labelAndIconRight(label: "Portal button", icon: "brain"), style: .outline, size: .small, enabled: true, action: {})
                .previewDisplayName("Style: outlined, size: small, enabled: true")
                .frame(width: 200)
                .padding()
            PButton(config: .labelAndIconRight(label: "Portal button", icon: "brain"), style: .outline, size: .medium, enabled: true, action: {})
                .previewDisplayName("Style: outlined, size: medium, enabled: true")
                .frame(width: 200)
                .padding()
            PButton(config: .labelAndIconRight(label: "Portal button", icon: "brain"), style: .outline, size: .big, enabled: true, action: {})
                .previewDisplayName("Style: outlined, size: big, enabled: true")
                .frame(width: 250)
                .padding()
            //filled
            PButton(config: .labelAndIconRight(label: "Portal button", icon: "brain"), style: .filled, size: .small, enabled: true, action: {})
                .previewDisplayName("Style: filled, size: small, enabled: true")
                .frame(width: 200)
                .padding()
            PButton(config: .labelAndIconRight(label: "Portal button", icon: "brain"), style: .filled, size: .medium, enabled: true, action: {})
                .previewDisplayName("Style: filled, size: medium, enabled: true")
                .frame(width: 200)
                .padding()
            PButton(config: .labelAndIconRight(label: "Portal button", icon: "brain"), style: .filled, size: .big, enabled: true, action: {})
                .previewDisplayName("Style: filled, size: big, enabled: true")
                .frame(width: 250)
                .padding()
        }
        .previewLayout(PreviewLayout.sizeThatFits)
        .background(Color(red: 58/255, green: 58/255, blue: 58/255, opacity: 1))
    }
}