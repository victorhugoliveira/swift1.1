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
    
    func executeOperation() -> (num: Double, status: String) {
        var result = 0.0
        var statusStr = "="
        switch operation{
        case "+":
            result = firstNumber + secondNumber
        case "-":
            result = firstNumber - secondNumber
        case "x":
            result = firstNumber * secondNumber
        case "/":
            if(secondNumber==0.0){
                statusStr = "err* /0"
                result = 0
            }else{
                result = firstNumber / secondNumber
            }
        default:
            statusStr = "no op"
        }
        return (result,statusStr)
    }
    
}
