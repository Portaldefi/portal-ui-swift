//
//  File.swift
//  
//
//  Created by farid on 9/9/22.
//

import SwiftUI

extension Font {
    public struct Main {
        /// Returns a fixed-size font of the specified style.
        public static func fixed(_ style: NotoSansMono, size: CGFloat) -> Font {
            Font.custom(style.name, fixedSize: size)
        }
        
        /// Returns a relative-size font of the specified style.
        public static func relative(_ style: NotoSansMono, size: CGFloat, relativeTo textStyle: Font.TextStyle) -> Font {
            Font.custom(style.name, size: size, relativeTo: textStyle)
        }
    }
}

struct MainFont_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Text("NotoSansMono-Thin")
                .font(.Main.relative(.thin, size: 28, relativeTo: .body))
                .foregroundColor(.white)
                .padding()
            
            Text("NotoSansMono-Light")
                .font(.Main.relative(.light, size: 28, relativeTo: .body))
                .foregroundColor(.white)
                .padding()
            
            Text("NotoSansMono-ExtraLight")
                .font(.Main.relative(.extraLight, size: 28, relativeTo: .body))
                .foregroundColor(.white)
                .padding()
            
            Text("NotoSansMono-Regular")
                .font(.Main.relative(.regular, size: 28, relativeTo: .body))
                .foregroundColor(.white)
                .padding()
            
            Text("NotoSansMono-Medium")
                .font(.Main.relative(.medium, size: 28, relativeTo: .body))
                .foregroundColor(.white)
                .padding()
            
            Text("NotoSansMono-SemiBold")
                .font(.Main.relative(.semiBold, size: 28, relativeTo: .body))
                .foregroundColor(.white)
                .padding()
            
            Text("NotoSansMono-Bold")
                .font(.Main.relative(.bold, size: 28, relativeTo: .body))
                .foregroundColor(.white)
                .padding()
            
            Text("NotoSansMono-ExtraBold")
                .font(.Main.relative(.extraBold, size: 28, relativeTo: .body))
                .foregroundColor(.white)
                .padding()
            
            Text("NotoSansMono-Black")
                .font(.Main.relative(.black, size: 28, relativeTo: .body))
                .foregroundColor(.white)
                .padding()
        }
        .previewLayout(PreviewLayout.sizeThatFits)
        .background(Color(red: 58/255, green: 58/255, blue: 58/255, opacity: 1))
    }
}
