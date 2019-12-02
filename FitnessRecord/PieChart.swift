//
//  PieChart.swift
//  FitnessRecord
//
//  Created by Kumo on 2019/11/30.
//  Copyright © 2019 Kumo. All rights reserved.
//

import Foundation
import SwiftUI

struct PieChart: Shape {
    var startAngle: Angle
    var endAngle: Angle
    func path(in rect: CGRect) -> Path {
        Path { (path) in
            let center = CGPoint(x: rect.midX, y: rect.midY)
            path.move(to: center)
            path.addArc(center: center, radius: rect.midX,
                        startAngle: startAngle, endAngle: endAngle, clockwise: false)
        }
    }
}
