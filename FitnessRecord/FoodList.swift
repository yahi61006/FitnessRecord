//
//  FoodList.swift
//  FitnessRecord
//
//  Created by Kumo on 2019/11/30.
//  Copyright © 2019 Kumo. All rights reserved.
//

import SwiftUI

struct FoodList: View {
    
    @ObservedObject var mealsData = FoodData()
    @State private var showFoodEdit = false
    
    /*let dateFormatter: DateFormatter = {
     let dateFormatter = DateFormatter()
     dateFormatter.dateFormat = "yyyy/MM/dd"
     return dateFormatter
     }()*/
    
    var body: some View {
        NavigationView{
            List{
                ForEach(mealsData.meals) { (meal) in
                    NavigationLink(destination: FoodEdit(mealsData: self.mealsData, editFood: meal)) {
                        FoodRow(meal: meal)
                    }
                }
                .onDelete { (IndexSet) in
                    self.mealsData.meals.remove(atOffsets: IndexSet)
                }
                .onMove { (indexSet, index) in
                    self.mealsData.meals.move(fromOffsets: indexSet,
                                              toOffset: index)
                }
            }
            .navigationBarTitle("飲食列表")
            .navigationBarItems(leading: EditButton(), trailing: Button(action: {
                self.showFoodEdit = true
            }, label: {
                Image(systemName: "folder.badge.plus")
                    .resizable()
                    .scaledToFill()
                    .frame(width:30, height:30)
            }))
                .sheet(isPresented: $showFoodEdit) {
                    NavigationView {
                        FoodEdit(mealsData: self.mealsData)
                    }
            }
        }
    }
}

struct FoodList_Previews: PreviewProvider {
    static var previews: some View {
        FoodList()
    }
}
