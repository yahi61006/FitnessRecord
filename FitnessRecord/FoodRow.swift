//
//  FoodRow.swift
//  FitnessRecord
//
//  Created by Kumo on 2019/11/30.
//  Copyright © 2019 Kumo. All rights reserved.
//

import SwiftUI

struct FoodRow: View {
    
    let dateFormatter: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy/MM/dd"
    return dateFormatter
    }()
    
    var meal:Food
    var body: some View {
        HStack{
            mealImage(Imageindex: meal.eatTimeIndex)
            VStack {
                Text(meal.name)
                Text(dateFormatter.string(from: meal.eatDate))
                    .foregroundColor(Color.purple)
            }
            VStack(alignment: .leading) {
                Text("蛋白質: \(NSString(format: "%.2f", meal.protein))")
                Text("脂肪: \(NSString(format: "%.2f", meal.fat))")
                Text("碳水化合物: \(NSString(format: "%.2f", meal.carbohydrate))")
            }
            Spacer()
            Image(systemName: meal.favorite ? "heart.fill" : "heart")
        }
    }
}

struct FoodRow_Previews: PreviewProvider {
    static var previews: some View {
        FoodRow(meal: Food(name: "chicken", eatDate: Date(), eatTimeIndex: 0, protein: 1.23, fat: 0, carbohydrate: 0, favorite: true))
    }
}

struct mealImage: View {
    var Imageindex:Int
    var eatTime = ["morning", "noon", "evening", "snack"]
    var timeImage = ["sunrise", "sun.max", "moon", "sunset"]
    var body: some View {
        HStack {
            Image(eatTime[Imageindex])
                .resizable()
                .scaledToFill()
                .frame(width:50, height:50)
                .clipShape(Circle())
            Image(systemName: timeImage[Imageindex])
                .resizable()
                .scaledToFill()
                .frame(width:30, height:30)
        }
    }
}
