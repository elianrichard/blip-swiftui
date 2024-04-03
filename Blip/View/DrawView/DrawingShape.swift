//
//  DrawingShape.swift
//  Blip
//
//  Created by Natasha Radika on 03/04/24.
//

import SwiftUI

struct DrawingShape: Shape {
    let points: [CGPoint]
    let engine = DrawingEngine()
    func path(in rect: CGRect) -> Path {
        engine.createPath(for: points)
    }
}
