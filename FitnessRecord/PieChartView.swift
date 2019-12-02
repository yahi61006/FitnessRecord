//
//  PieChartView.swift
//  FitnessRecord
//
//  Created by Kumo on 2019/11/30.
//  Copyright © 2019 Kumo. All rights reserved.
//

import SwiftUI

struct PieChartView: View {
    var percentages: [Double]
    var angles: [Angle]
    
    init(percentages: [Double]) {
        self.percentages = percentages
        angles = [Angle]()
        var startDegree: Double = 0
        for percentage in percentages {
            angles.append(.degrees(startDegree))
            startDegree += 360 * percentage / 100
        }
    }
    
    var body: some View {
        ZStack {
            PieChart(startAngle: self.angles[0], endAngle: self.angles[1])
                .fill(Color.blue)
            PieChart(startAngle: self.angles[1], endAngle: self.angles[2])
                .fill(Color.red)
            PieChart(startAngle: self.angles[2], endAngle: self.angles[0])
                .fill(Color.green)
        }
    }
}


struct PieChartView_Previews: PreviewProvider {
    static var previews: some View {
        PieChartView(percentages: [25, 10, 65])
    }
}
