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
    
      func appendToNumberStr(numStr : String){
        if(currentNumberStr.count<11){
            if ((numStr != "0") || (currentNumberStr != "0")){
                if((currentNumberStr == "0")&&(numStr != ".")){
                    currentNumberStr = numStr
                }else{
                    currentNumberStr.append(numStr)
                }
            }
        }
     }   
    
    
}
