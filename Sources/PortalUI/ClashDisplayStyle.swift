//
//  File.swift
//  
//
//  Created by farid on 20.09.2024.
//

import SwiftUI

public struct ClashDisplayStyle {
    public let name: String
    
    private init(named name: String) {
        self.name = name
        do {
            try registerFont(named: name)
        } catch {
            let reason = error.localizedDescription
            fatalError("Failed to register font: \(reason)")
        }
    }
    
    public static let bold = ClashDisplayStyle(named: "ClashDisplay-Bold")
    public static let extraLight = ClashDisplayStyle(named: "ClashDisplay-Extralight")
    public static let light = ClashDisplayStyle(named: "ClashDisplay-Light")
    public static let medium = ClashDisplayStyle(named: "ClashDisplay-Medium")
    public static let regular = ClashDisplayStyle(named: "ClashDisplay-Regular")
    public static let semibold = ClashDisplayStyle(named: "ClashDisplay-Semibold")
}
