//
//  SwiftUIView.swift
//  
//
//  Created by farid on 8/11/22.
//

import SwiftUI

public struct CameraTargetOverlayView: View {
    private let innerColor = Color(red: 170/255, green: 170/255, blue: 170/255, opacity: 1)
    private let internalColor = Color(red: 26/255, green: 26/255, blue: 26/255, opacity: 1)
    
    public init() {}
    
    public var body: some View {
        ZStack {
            CameraTargetShape(inner: false)
                .foregroundColor(innerColor)
            CameraTargetShape(inner: true)
                .foregroundColor(internalColor)
        }
        .frame(width: 287, height: 287)
    }
}

struct CameraTargetOverlayView_Previews: PreviewProvider {
    static var previews: some View {
        CameraTargetOverlayView()
            .previewLayout(PreviewLayout.sizeThatFits)
            .padding()
            .background(.gray)
    }
}
