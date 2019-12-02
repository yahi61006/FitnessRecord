//
//  FoodEdit.swift
//  FitnessRecord
//
//  Created by Kumo on 2019/11/30.
//  Copyright © 2019 Kumo. All rights reserved.
//

import SwiftUI

struct FoodEdit: View {
    @Environment(\.presentationMode) var presentationMode
    var eatTime = ["早餐", "午餐", "晚餐", "點心"]
    var nutritions = ["蛋白質", "脂肪", "碳水化合物"]
    var mealsData: FoodData
    @State private var name = ""
    @State private var protein:Double = 0
    @State private var fat:Double = 0
    @State private var carbohydrate:Double = 0
    @State private var eatTimeIndex = 0
    @State private var favorite = false
    @State private var eatDate = Date()
    let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        return dateFormatter
    }()
    
    var editFood: Food?
    @State private var showBarChart = false
    @State private var showPieChart = false
    
    var body: some View {
        VStack{
            Form{
                TextField("餐點名稱", text: $name)
                    //.frame(width: 300, height: 50)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 50).stroke(Color.green, lineWidth: 5))
                    .padding()
                
                VStack {
                    DatePicker("吃飯日期", selection: $eatDate, displayedComponents: .date)
                    Text(dateFormatter.string(from: eatDate))
                }
                
                Picker("哪一餐", selection: $eatTimeIndex) {
                    ForEach(0..<eatTime.count){ (index) in
                        Text(self.eatTime[index])
                    }
                }.pickerStyle(SegmentedPickerStyle())
                
                Toggle("我的最愛", isOn: $favorite)
                
                
                Nutrition(protein: self.$protein, fat: self.$fat, carbohydrate: self.$carbohydrate, nutritionName: nutritions[0], nutritionIndex: 0)
                Nutrition(protein: self.$protein, fat: self.$fat, carbohydrate: self.$carbohydrate, nutritionName: nutritions[1], nutritionIndex: 1)
                Nutrition(protein: self.$protein, fat: self.$fat, carbohydrate: self.$carbohydrate, nutritionName: nutritions[2], nutritionIndex: 2)
                
                HStack(spacing: 50){
                    Text("顯示各成分熱量")
                        .padding()
                        .foregroundColor(Color.white)
                        .background(Color.green)
                        .cornerRadius(30)
                        .onTapGesture {
                            self.showBarChart = true
                    }.sheet(isPresented: $showBarChart) {
                        FoodBarAnalysis(protein: self.$protein, fat: self.$fat, carbohydrate: self.$carbohydrate)
                    }
                    
                    Text("顯示營養比例")
                        .padding()
                        .foregroundColor(Color.white)
                        .background(Color.blue)
                        .cornerRadius(30)
                        .onTapGesture {
                            self.showPieChart = true
                    }.sheet(isPresented: $showPieChart) {
                        FoodAnalysis(protein: self.$protein, fat: self.$fat, carbohydrate: self.$carbohydrate)
                    }
                }
                .padding()
            }
        }
        .navigationBarTitle(editFood == nil ? "新增餐點" : "編輯餐點")
        .navigationBarItems(trailing: Button("Save"){
            let meal = Food(name: self.name, eatDate: self.eatDate, eatTimeIndex: self.eatTimeIndex, protein: self.protein, fat: self.fat, carbohydrate: self.carbohydrate, favorite: self.favorite)
            if let editFood = self.editFood {
                let index = self.mealsData.meals.firstIndex {
                    $0.id == editFood.id
                    }!
                self.mealsData.meals[index] = meal
            }
            else{
                self.mealsData.meals.insert(meal, at: 0)
            }
            self.presentationMode.wrappedValue.dismiss()
        })
            .onAppear{
                if let editFood = self.editFood{
                    self.name = editFood.name
                    self.protein = editFood.protein
                    self.fat = editFood.fat
                    self.carbohydrate = editFood.carbohydrate
                    self.eatTimeIndex = editFood.eatTimeIndex
                    self.favorite = editFood.favorite
                    self.eatDate = editFood.eatDate
                }
        }
    }
}

struct FoodEdit_Previews: PreviewProvider {
    static var previews: some View {
        FoodEdit(mealsData: FoodData())
    }
}

struct Nutrition: View {
    @Binding var protein:Double
    @Binding var fat:Double
    @Binding var carbohydrate:Double
    var nutritionName:String
    var nutritionIndex:Int
    var body: some View {
        HStack{
            Text(nutritionName)
                .foregroundColor(Color.purple)
            if nutritionIndex == 0 {
                TextField(nutritionName, value: $protein ,formatter: DoubleFormatter())
                    .keyboardType(.numberPad)
                    .padding()
            }
            else if nutritionIndex == 1{
                TextField(nutritionName, value: $fat ,formatter: DoubleFormatter())
                    .keyboardType(.numberPad)
                    .padding()
            }
            else{
                TextField(nutritionName, value: $carbohydrate ,formatter: DoubleFormatter())
                    .keyboardType(.numberPad)
                    .padding()
            }
            Text("克")
        }
    }
}
