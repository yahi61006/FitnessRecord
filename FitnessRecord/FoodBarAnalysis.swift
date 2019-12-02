//
//  FoodBarAnalysis.swift
//  FitnessRecord
//
//  Created by Kumo on 2019/12/1.
//  Copyright © 2019 Kumo. All rights reserved.
//

import SwiftUI

struct FoodBarAnalysis: View {
    @Binding var protein:Double
    @Binding var fat:Double
    @Binding var carbohydrate:Double
    var body: some View {
        VStack {
            Text("各成分熱量(大卡)")
                .font(.largeTitle)
                .foregroundColor(Color.purple)
            HStack{
                VStack{
                    Text("蛋白質")
                        .padding(EdgeInsets(top: 40, leading: -10, bottom: 0, trailing: -20))
                    Text("脂肪")
                        .padding(EdgeInsets(top: 40, leading: -10, bottom: 0, trailing: -40))
                    Text("碳水化合物")
                        .padding(EdgeInsets(top: 40, leading: -40, bottom: 0, trailing: -25))
                }
                .frame(width: 60, height: 270)
                .padding(EdgeInsets(top: 0, leading: -35, bottom: 0, trailing: 0))
                ZStack(alignment: .leading){
                    Path{
                        (path) in
                        path.move(to: CGPoint(x: 0, y: 20))
                        path.addLine(to: CGPoint(x: 0, y: 270))
                        path.addLine(to: CGPoint(x: 300, y: 270))
                    }
                    .stroke(Color.black, lineWidth: 2)
                    BarChartView(typeWidths: [protein*4, fat*9 ,carbohydrate*4])
                }
            }
            .frame(width: 300, height: 270)
            .padding()
            VStack(alignment: .leading,spacing: 20){
                Text("蛋白質: \(NSString(format: "%.2f", protein*4))大卡")
                Text("脂肪: \(NSString(format: "%.2f", fat*9))大卡")
                Text("碳水化合物: \(NSString(format: "%.2f", carbohydrate*4))大卡")
            }
        }
    }
}

struct FoodBarAnalysis_Previews: PreviewProvider {
    static var previews: some View {
        FoodBarAnalysis(protein: .constant(10), fat: .constant(0.7), carbohydrate: .constant(6.2))
    }
}
