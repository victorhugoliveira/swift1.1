//
//  Model.swift
//  SCalc WatchKit Extension
//
//  Created by Plinio Vilela on 06/05/19.
//  Copyright © 2019 Plinio Vilela. All rights reserved.
//

import Foundation

extension Double {    
    func toString(decimal: Int = 9) -> String {
        let value = decimal < 0 ? 0 : decimal
        var string = String(format: "%.\(value)f", self)
        
        while string.last == "0" || string.last == "." {
            if string.last == "." { string = String(string.dropLast()); break}
            string = String(string.dropLast())
        }
        return string
    }
}



open class Model {

    
}
