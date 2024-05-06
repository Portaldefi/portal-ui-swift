//
//  PButtonConfig.swift
//  
//
//  Created by farid on 2/3/23.
//

import Foundation

public struct PButtonConfig: Equatable {
    let fontSize: CGFloat
    let spacing: CGFloat
    let height: CGFloat
    let cornerRadius: CGFloat
    let iconSize: CGFloat
    let grayIcon: Bool
    
    public init(fontSize: CGFloat, spacing: CGFloat, height: CGFloat, cornerRadius: CGFloat, iconSize: CGFloat, grayIcon: Bool) {
        self.fontSize = fontSize
        self.spacing = spacing
        self.height = height
        self.cornerRadius = cornerRadius
        self.iconSize = iconSize
        self.grayIcon = grayIcon
    }
}
