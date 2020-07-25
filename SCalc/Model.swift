//
//  Model.swift
//  SCalc WatchKit Extension
//
//  Created by Plinio Vilela on 06/05/19.
//  Copyright © 2019 Plinio Vilela. All rights reserved.
//

import Foundation


open class Model {
    var currentNumberStr = "0"
    var firstNumber = 0.0
    var secondNumber = 0.0
    var operation = ""
    var state = "firstNumberState"
    var negation = false
    
    
    func clearLabel(){
        // Basically resets everything
        currentNumberStr = "0"
        operation = ""
        firstNumber = 0.0
        secondNumber = 0.0
    }
    
    
    
}
