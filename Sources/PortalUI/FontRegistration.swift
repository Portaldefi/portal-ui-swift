//
//  FontRegistration.swift
//  
//
//  Created by farid on 9/9/22.
//

import Foundation
import UIKit
import CoreGraphics
import CoreText

public enum FontError: Swift.Error {
    case failedToRegisterFont
}

func registerFont(named name: String) throws {
    guard let asset = NSDataAsset(name: "Fonts/\(name)", bundle: Bundle.module),
          let provider = CGDataProvider(data: asset.data as NSData),
          let font = CGFont(provider),
          CTFontManagerRegisterGraphicsFont(font, nil) else {
        throw FontError.failedToRegisterFont
    }
}
