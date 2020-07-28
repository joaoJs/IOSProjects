//
//  NumberModel.swift
//  Programmatic
//
//  Created by Joao Campos on 7/28/20.
//  Copyright © 2020 Joao Campos. All rights reserved.
//

import UIKit

struct NumberModel {
    
    var data: String
    
    init(data: Int) {
        self.data = "\(data)"
    }
    
    init(data: String) {
        self.data = data
    }
    
}
