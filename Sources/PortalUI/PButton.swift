//
//  PButton.swift
//  
//
//  Created by farid on 8/2/22.
//

import SwiftUI

struct GradientMask: ViewModifier {
    let apply: Bool
    let enabled: Bool
    
    func body(content: Content) -> some View {
        if apply {
            RadialGradient.main.mask {
                content
            }
//            .opacity(enabled ? 1 : 0.35)
        } else {
            content
        }
    }
}

extension View {
    func applyGradientMask(_ apply: Bool, enabled: Bool) -> some View {
        modifier(GradientMask(apply: apply, enabled: enabled))
    }
}

public struct PButton: View {
    private let config: Config
    private let style: Style
    private let applyGradient: Bool
    private let size: Size
    private let color: Color?
    private let enabled: Bool
    private let action: () -> Void
    
    public enum Style {
        case filled, outline, free
    }
    
    public enum Config {
        case onlyLabel(String),
             onlyIcon(Image),
             labelAndIconLeft(label: String, icon: Image),
             labelAndIconRight(label: String, icon: Image)
    }
    
    public enum Size {
        case small, medium, big, custom(_ config: PButtonConfig)
    }
    
    private var iconSize: CGFloat {
        switch size {
        case .small: return 20
        case .medium: return 26
        case .big:
            if case .onlyIcon = config {
                return 40
            }
            return 30
        case .custom(let config):
            return config.iconSize
        }
    }
    
    private var font: Font {
        switch size {
        case .small, .medium:
            return .Main.fixed(.monoBold, size: 16)
        case .big:
            return .Main.fixed(.monoBold, size: 20)
        case .custom(let config):
            return .Main.fixed(.monoBold, size: config.fontSize)
        }
    }
    
    private var stackSpacing: CGFloat {
        switch size {
        case .small: return 6
        case .medium: return 6
        case .big: return 6
        case .custom(let config):
            return config.spacing
        }
    }
    
    public init(
        config: Config,
        style: Style,
        size: Size,
        color: Color? = nil,
        applyGradient: Bool = false,
        enabled: Bool,
        action: @escaping () -> Void
    ) {
        self.config = config
        self.style = style
        self.size = size
        self.color = color
        self.applyGradient = applyGradient
        self.enabled = enabled
        self.action = action
    }
    
    var isCustomSize: Bool {
        if case .custom(_) = size {
            return true
        }
        return false
    }
            
    public var body: some View {
        Button(action: {
            action()
        }) {
            Group {
                switch config {
                case .onlyLabel(let label):
                    Text(label)
                        .font(font)
                case .onlyIcon(let icon):
                    icon
                        .resizable()
                        .frame(width: iconSize, height: iconSize)
                case .labelAndIconLeft(let label, let icon):
                    HStack(spacing: stackSpacing) {
                        icon
                            .resizable()
                            .frame(width: iconSize, height: iconSize)
                            .if(isCustomSize) { view in
                                view.foregroundColor(.white)
                            }
                        Text(label)
                            .font(font)
                    }
                case .labelAndIconRight(let label, let icon):
                    HStack(spacing: stackSpacing) {
                        Text(label)
                            .font(font)
                        icon
                            .resizable()
                            .frame(width: iconSize, height: iconSize)
                    }
                }
            }
            .applyGradientMask(applyGradient, enabled: enabled)
        }
        .buttonStyle(PortalButtonStyle(style: style, size: size, color: color, enabled: enabled))
        .disabled(!enabled)
    }
}

struct PButton_Previews_OnlyIcon: PreviewProvider {
    static var previews: some View {
        Group {
            //free
            PButton(config: .onlyIcon(Asset.gearIcon), style: .free, size: .small, enabled: true, action: {})
                .previewDisplayName("Style: free, size: small, enabled: true")
                .frame(width: 30)
            
            PButton(config: .onlyIcon(Asset.gearIcon), style: .free, size: .medium, enabled: true, action: {})
                .previewDisplayName("Style: free, size: medium, enabled: true")
                .frame(width: 40)
            
            PButton(config: .onlyIcon(Asset.gearIcon), style: .free, size: .big, enabled: true, action: {})
                .previewDisplayName("Style: free, size: big, enabled: true")
                .frame(width: 60)
            //outline
            PButton(config: .onlyIcon(Asset.gearIcon), style: .outline, size: .small, enabled: true, action: {})
                .previewDisplayName("Style: outline, size: small, enabled: true")
                .frame(width: 30)
                .padding()
            
            PButton(config: .onlyIcon(Asset.gearIcon), style: .outline, size: .medium, enabled: true, action: {})
                .previewDisplayName("Style: outline, size: medium, enabled: true")
                .frame(width: 40)
                .padding()
            
            PButton(config: .onlyIcon(Asset.gearIcon), style: .outline, size: .big, enabled: true, action: {})
                .previewDisplayName("Style: outline, size: big, enabled: true")
                .frame(width: 60)
                .padding()
            //filled
            PButton(config: .onlyIcon(Asset.gearIcon), style: .filled, size: .small, enabled: true, action: {})
                .previewDisplayName("Style: filled, size: small, enabled: true")
                .frame(width: 30)
                .padding()
            
            PButton(config: .onlyIcon(Asset.gearIcon), style: .filled, size: .medium, enabled: true, action: {})
                .previewDisplayName("Style: filled, size: medium, enabled: true")
                .frame(width: 40)
                .padding()
            
            PButton(config: .onlyIcon(Asset.gearIcon), style: .filled, size: .big, enabled: true, action: {})
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
            PButton(config: .labelAndIconLeft(label: "Portal button", icon: Asset.gearIcon), style: .free, size: .small, enabled: true, action: {})
                .previewDisplayName("Style: free, size: small, enabled: true")
                .frame(width: 200)
            PButton(config: .labelAndIconLeft(label: "Portal button", icon: Asset.gearIcon), style: .free, size: .medium, enabled: true, action: {})
                .previewDisplayName("Style: free, size: medium, enabled: true")
                .frame(width: 200)
            PButton(config: .labelAndIconLeft(label: "Portal button", icon: Asset.gearIcon), style: .free, size: .big, enabled: true, action: {})
                .previewDisplayName("Style: free, size: big, enabled: true")
                .frame(width: 250)
            //outlined
            PButton(config: .labelAndIconLeft(label: "Portal button", icon: Asset.gearIcon), style: .outline, size: .small, enabled: true, action: {})
                .previewDisplayName("Style: outlined, size: small, enabled: true")
                .frame(width: 200)
                .padding()
            PButton(config: .labelAndIconLeft(label: "Portal button", icon: Asset.gearIcon), style: .outline, size: .medium, enabled: true, action: {})
                .previewDisplayName("Style: outlined, size: medium, enabled: true")
                .frame(width: 200)
                .padding()
            PButton(config: .labelAndIconLeft(label: "Portal button", icon: Asset.gearIcon), style: .outline, size: .big, enabled: true, action: {})
                .previewDisplayName("Style: outlined, size: big, enabled: true")
                .frame(width: 250)
                .padding()
            //filled
            PButton(config: .labelAndIconLeft(label: "Portal button", icon: Asset.gearIcon), style: .filled, size: .small, enabled: true, action: {})
                .previewDisplayName("Style: filled, size: small, enabled: true")
                .frame(width: 200)
                .padding()
            PButton(config: .labelAndIconLeft(label: "Portal button", icon: Asset.gearIcon), style: .filled, size: .medium, enabled: true, action: {})
                .previewDisplayName("Style: filled, size: medium, enabled: true")
                .frame(width: 200)
                .padding()
            PButton(config: .labelAndIconLeft(label: "Portal button", icon: Asset.gearIcon), style: .filled, size: .big, enabled: true, action: {})
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
            PButton(config: .labelAndIconRight(label: "Portal button", icon: Asset.gearIcon), style: .free, size: .small, enabled: true, action: {})
                .previewDisplayName("Style: free, size: small, enabled: true")
                .frame(width: 200)
            PButton(config: .labelAndIconRight(label: "Portal button", icon: Asset.gearIcon), style: .free, size: .medium, enabled: true, action: {})
                .previewDisplayName("Style: free, size: medium, enabled: true")
                .frame(width: 200)
            PButton(config: .labelAndIconRight(label: "Portal button", icon: Asset.gearIcon), style: .free, size: .big, enabled: true, action: {})
                .previewDisplayName("Style: free, size: big, enabled: true")
                .frame(width: 250)
            //outlined
            PButton(config: .labelAndIconRight(label: "Portal button", icon: Asset.gearIcon), style: .outline, size: .small, enabled: true, action: {})
                .previewDisplayName("Style: outlined, size: small, enabled: true")
                .frame(width: 200)
                .padding()
            PButton(config: .labelAndIconRight(label: "Portal button", icon: Asset.gearIcon), style: .outline, size: .medium, enabled: true, action: {})
                .previewDisplayName("Style: outlined, size: medium, enabled: true")
                .frame(width: 200)
                .padding()
            PButton(config: .labelAndIconRight(label: "Portal button", icon: Asset.gearIcon), style: .outline, size: .big, enabled: true, action: {})
                .previewDisplayName("Style: outlined, size: big, enabled: true")
                .frame(width: 250)
                .padding()
            //filled
            PButton(config: .labelAndIconRight(label: "Portal button", icon: Asset.gearIcon), style: .filled, size: .small, enabled: true, action: {})
                .previewDisplayName("Style: filled, size: small, enabled: true")
                .frame(width: 200)
                .padding()
            PButton(config: .labelAndIconRight(label: "Portal button", icon: Asset.gearIcon), style: .filled, size: .medium, enabled: true, action: {})
                .previewDisplayName("Style: filled, size: medium, enabled: true")
                .frame(width: 200)
                .padding()
            PButton(config: .labelAndIconRight(label: "Portal button", icon: Asset.gearIcon), style: .filled, size: .big, enabled: true, action: {})
                .previewDisplayName("Style: filled, size: big, enabled: true")
                .frame(width: 250)
                .padding()
        }
        .previewLayout(PreviewLayout.sizeThatFits)
        .background(Color(red: 58/255, green: 58/255, blue: 58/255, opacity: 1))
    }
}
