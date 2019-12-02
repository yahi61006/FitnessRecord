//
//  FoodAnalysis.swift
//  FitnessRecord
//
//  Created by Kumo on 2019/11/30.
//  Copyright © 2019 Kumo. All rights reserved.
//

import SwiftUI

struct FoodAnalysis: View {
    @Binding var protein:Double
    @Binding var fat:Double
    @Binding var carbohydrate:Double
    var body: some View {
        VStack {
            Text("營養比例")
                .font(.largeTitle)
                .foregroundColor(Color.purple)
            PieChartView(percentages: [100*protein*4/(protein*4+fat*9+carbohydrate*4), 100*fat*9/(protein*4+fat*9+carbohydrate*4), 100*carbohydrate*4/(protein*4+fat*9+carbohydrate*4)])
                .frame(width: 200, height: 200)
            Text("總熱量: \(NSString(format: "%.2f", (protein*4+fat*9+carbohydrate*4)))大卡")
            HStack{
                Circle()
                    .fill(Color.blue)
                    .frame(width: 20, height: 20)
                Text("蛋白質")
                Circle()
                    .fill(Color.red)
                    .frame(width: 20, height: 20)
                Text("脂肪")
                Circle()
                    .fill(Color.green)
                    .frame(width: 20, height: 20)
                Text("碳水化合物")
            }
        }
    }
}


struct FoodAnalysis_Previews: PreviewProvider {
    static var previews: some View {
        FoodAnalysis(protein: .constant(6), fat: .constant(0.3), carbohydrate: .constant(6.2))
    }
}
