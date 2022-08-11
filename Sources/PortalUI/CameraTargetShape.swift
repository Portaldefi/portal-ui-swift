//
//  File.swift
//  
//
//  Created by farid on 8/11/22.
//

import SwiftUI

struct CameraTargetShape: Shape {
    private let padding: CGFloat = 20
    private let inner: Bool
    
    init(inner: Bool) {
        self.inner = inner
    }
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: padding, y: inner ? 4 : 0))
            path.addQuadCurve(to: CGPoint(x: inner ? 4 : 0, y: padding), control: CGPoint(x: inner ? 2 : -2, y: inner ? 2 : -2))
            path.move(to: CGPoint(x: rect.width - padding, y: inner ? 4 : 0))
            path.addQuadCurve(to: CGPoint(x: inner ? rect.width - 4 : rect.width, y: padding), control: CGPoint(x: inner ? rect.width - 2 : rect.width + 2, y: inner ? 2 : -2))
            path.move(to: CGPoint(x: padding, y: inner ? rect.height - 4 : rect.height))
            path.addQuadCurve(to: CGPoint(x: inner ? 4 : 0, y: rect.height - padding), control: CGPoint(x: inner ? 2 : -2, y: inner ? rect.height - 2 : rect.height))
            path.move(to: CGPoint(x: inner ? rect.width - 4 : rect.width, y: rect.height - padding))
            path.addQuadCurve(to: CGPoint(x: rect.width - padding, y: inner ? rect.height - 4 : rect.height), control: CGPoint(x: inner ? rect.width - 2 : rect.width + 2, y: inner ? rect.height - 2 : rect.height + 2))
        }
        .strokedPath(.init(lineWidth: 2, lineCap: .square, lineJoin: .round, miterLimit: 1, dash: [40], dashPhase: 1))
    }
}
