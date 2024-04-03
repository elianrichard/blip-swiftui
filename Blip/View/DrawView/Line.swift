//
//  Line.swift
//  Blip
//
//  Created by Natasha Radika on 03/04/24.
//

import Foundation
import SwiftUI

struct Line: Identifiable {
    
    var points: [CGPoint]
    var color: Color
    var lineWidth: CGFloat

    let id = UUID()
}
