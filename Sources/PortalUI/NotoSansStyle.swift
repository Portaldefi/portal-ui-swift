//
//  NotoSans.swift
//  
//
//  Created by farid on 9/9/22.
//

import SwiftUI

public struct NotoSansStyle {
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
    
    public static let monoLight = NotoSansStyle(named: "NotoSansMono-Light")
    public static let monoExtraLight = NotoSansStyle(named: "NotoSansMono-ExtraLight")
    public static let monoRegular = NotoSansStyle(named: "NotoSansMono-Regular")
    public static let monoBold = NotoSansStyle(named: "NotoSansMono-Bold")
    public static let monoExtraBold = NotoSansStyle(named: "NotoSansMono-ExtraBold")
    public static let monoBlack = NotoSansStyle(named: "NotoSansMono-Black")
    public static let monoMedium = NotoSansStyle(named: "NotoSansMono-Medium")
    public static let monoSemiBold = NotoSansStyle(named: "NotoSansMono-SemiBold")
    public static let monoThin = NotoSansStyle(named: "NotoSansMono-Thin")
    public static let regular = NotoSansStyle(named: "NotoSans-Regular")
    public static let bold = NotoSansStyle(named: "NotoSans-Bold")
}
