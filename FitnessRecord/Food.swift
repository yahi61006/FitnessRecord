//
//  Food.swift
//  FitnessRecord
//
//  Created by Kumo on 2019/11/30.
//  Copyright © 2019 Kumo. All rights reserved.
//

import Foundation

struct Food: Identifiable, Codable{
    var id = UUID()
    var name: String
    var eatDate: Date
    var eatTimeIndex: Int
    var protein: Double
    var fat: Double
    var carbohydrate: Double
    var favorite: Bool
}
