//
//  NotoSansMono.swift
//  
//
//  Created by farid on 9/9/22.
//

import SwiftUI

public struct NotoSansMono {
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
    
    public static let light = NotoSansMono(named: "NotoSansMono-Light")
    public static let extraLight = NotoSansMono(named: "NotoSansMono-ExtraLight")
    public static let regular = NotoSansMono(named: "NotoSansMono-Regular")
    public static let bold = NotoSansMono(named: "NotoSansMono-Bold")
    public static let extraBold = NotoSansMono(named: "NotoSansMono-ExtraBold")
    public static let black = NotoSansMono(named: "NotoSansMono-Black")
    public static let medium = NotoSansMono(named: "NotoSansMono-Medium")
    public static let semiBold = NotoSansMono(named: "NotoSansMono-SemiBold")
    public static let thin = NotoSansMono(named: "NotoSansMono-Thin")
}
