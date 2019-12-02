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

public class DoubleFormatter: Formatter {

    override public func string(for obj: Any?) -> String? {
        var retVal: String?
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal

        if let dbl = obj as? Double {
            retVal = formatter.string(from: NSNumber(value: dbl))
        } else {
            retVal = nil
        }

        return retVal
    }

    override public func getObjectValue(_ obj: AutoreleasingUnsafeMutablePointer<AnyObject?>?, for string: String, errorDescription error: AutoreleasingUnsafeMutablePointer<NSString?>?) -> Bool {

        var retVal = true

        if let dbl = Double(string), let objok = obj {
            objok.pointee = dbl as AnyObject?
            retVal = true
        } else {
            retVal = false
        }

        return retVal

    }
}
