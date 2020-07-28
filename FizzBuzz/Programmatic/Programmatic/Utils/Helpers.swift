//
//  Helpers.swift
//  Programmatic
//
//  Created by Joao Campos on 7/28/20.
//  Copyright © 2020 Joao Campos. All rights reserved.
//

import UIKit

class Helpers {
    
    static func populateNumbers() -> [NumberModel] {
        var tempArr: [NumberModel] = []
        for n in 1...60 {
            let numberModel = NumberModel(data: fizzBuzz(num: n))
            tempArr.append(numberModel)
        }
        return tempArr
    }
    
    private static func fizzBuzz(num: Int) -> String {
        var res: String
        if (num.isMultiple(of: 6)) {
            res = "fizzbuzz"
        } else if (num.isMultiple(of: 3)) {
            res = "buzz"
        } else if (num.isMultiple(of: 2)) {
            res = "fizz"
        } else {
            res = "\(num)"
        }
        return res
    }
    
}
