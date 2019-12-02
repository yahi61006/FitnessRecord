//
//  FoodData.swift
//  FitnessRecord
//
//  Created by Kumo on 2019/11/30.
//  Copyright © 2019 Kumo. All rights reserved.
//

import Foundation


class FoodData: ObservableObject {
    @Published var meals = [Food](){
        didSet {
            let encoder = JSONEncoder()
            if let data = try? encoder.encode(meals) {
                UserDefaults.standard.set(data, forKey: "meals")
            }
        }
    }
    
    init() {
        if let data = UserDefaults.standard.data(forKey: "meals") {
            let decoder = JSONDecoder()
            if let decodedData = try? decoder.decode([Food].self, from: data) {
                meals = decodedData
            }
        }
    }
}
