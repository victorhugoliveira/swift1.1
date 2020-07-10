//
//  InterfaceController.swift
//  Simple Calculator WatchKit Extension
//
//  Created by Plinio Vilela on 29/04/19.
//  Copyright © 2019 Plinio Vilela. All rights reserved.
//

import WatchKit
import Foundation

extension Formatter {
    static let scientific: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .scientific
        formatter.positiveFormat = "0.###E+0"
        formatter.exponentSymbol = "e"
        return formatter
    }()
}

extension Numeric {
    var scientificFormatted: String {
        return Formatter.scientific.string(for: self) ?? ""
    }
}

class InterfaceController: WKInterfaceController {
    @IBOutlet weak var numberOnDisplay: WKInterfaceLabel!
    @IBOutlet weak var statusLabel: WKInterfaceLabel!
    
    var model : Model
    
    override init(){
        model = Model()
        print(Locale.current.decimalSeparator!)
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    
    func setDisplay(num : Double){
        //let strNum = String(num)
        var roundNum = num
        roundNum.round()
        //if (strNum.count > 13){
        if(String(roundNum).count>13){
            numberOnDisplay.setText(String(num.scientificFormatted))
        }else{
            if(roundNum==num){
                numberOnDisplay.setText(String(format: "%.0f", num))
            }else{
                numberOnDisplay.setText(String(num))
            }
            
        }
    }
        

    func treatEvent(event : String){
        let result = model.treatEvent(event: event)
        setDisplay(num : Double(result.num)!)
        statusLabel.setText(result.status)
    }

}
