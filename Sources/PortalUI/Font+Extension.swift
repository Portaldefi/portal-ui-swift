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
        public static func fixed(_ style: NotoSansStyle, size: CGFloat) -> Font {
            Font.custom(style.name, fixedSize: size)
        }
        
        /// Returns a relative-size font of the specified style.
        public static func relative(_ style: NotoSansStyle, size: CGFloat, relativeTo textStyle: Font.TextStyle) -> Font {
            Font.custom(style.name, size: size, relativeTo: textStyle)
        }
    }
}

struct MainFont_RelativeToBody_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Text("NotoSansMono-Thin")
                .font(.Main.relative(.monoThin, size: 28, relativeTo: .body))
                .foregroundColor(.white)
                .padding()
            
            Text("NotoSansMono-Light")
                .font(.Main.relative(.monoLight, size: 28, relativeTo: .body))
                .foregroundColor(.white)
                .padding()
            
            Text("NotoSansMono-ExtraLight")
                .font(.Main.relative(.monoExtraLight, size: 28, relativeTo: .body))
                .foregroundColor(.white)
                .padding()
            
            Text("NotoSansMono-Regular")
                .font(.Main.relative(.monoRegular, size: 28, relativeTo: .body))
                .foregroundColor(.white)
                .padding()
            
            Text("NotoSansMono-Medium")
                .font(.Main.relative(.monoMedium, size: 28, relativeTo: .body))
                .foregroundColor(.white)
                .padding()
            
            Text("NotoSansMono-SemiBold")
                .font(.Main.relative(.monoSemiBold, size: 28, relativeTo: .body))
                .foregroundColor(.white)
                .padding()
            
            Text("NotoSansMono-Bold")
                .font(.Main.relative(.monoBold, size: 28, relativeTo: .body))
                .foregroundColor(.white)
                .padding()
            
            Text("NotoSansMono-ExtraBold")
                .font(.Main.relative(.monoExtraBold, size: 28, relativeTo: .body))
                .foregroundColor(.white)
                .padding()
            
            Text("NotoSansMono-Black")
                .font(.Main.relative(.monoBlack, size: 28, relativeTo: .body))
                .foregroundColor(.white)
                .padding()
        }
        .previewLayout(PreviewLayout.sizeThatFits)
        .background(Color(red: 58/255, green: 58/255, blue: 58/255, opacity: 1))
    }
}

struct MainFont_Fixed_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Text("NotoSansMono-Thin")
                .font(.Main.fixed(.monoThin, size: 28))
                .foregroundColor(.white)
                .padding()
            
            Text("NotoSansMono-Light")
                .font(.Main.fixed(.monoLight, size: 28))
                .foregroundColor(.white)
                .padding()
            
            Text("NotoSansMono-ExtraLight")
                .font(.Main.fixed(.monoExtraLight, size: 28))
                .foregroundColor(.white)
                .padding()
            
            Text("NotoSansMono-Regular")
                .font(.Main.fixed(.monoRegular, size: 28))
                .foregroundColor(.white)
                .padding()
            
            Text("NotoSansMono-Medium")
                .font(.Main.fixed(.monoMedium, size: 28))
                .foregroundColor(.white)
                .padding()
            
            Text("NotoSansMono-SemiBold")
                .font(.Main.fixed(.monoSemiBold, size: 28))
                .foregroundColor(.white)
                .padding()
            
            Text("NotoSansMono-Bold")
                .font(.Main.fixed(.monoBold, size: 28))
                .foregroundColor(.white)
                .padding()
            
            Text("NotoSansMono-ExtraBold")
                .font(.Main.fixed(.monoExtraBold, size: 28))
                .foregroundColor(.white)
                .padding()
            
            Text("NotoSansMono-Black")
                .font(.Main.fixed(.monoBlack, size: 28))
                .foregroundColor(.white)
                .padding()
        }
        .previewLayout(PreviewLayout.sizeThatFits)
        .background(Color(red: 58/255, green: 58/255, blue: 58/255, opacity: 1))
    }
}
