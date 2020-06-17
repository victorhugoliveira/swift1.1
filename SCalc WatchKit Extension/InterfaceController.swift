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

    
    @IBAction func buttonZero() {
        treatEvent(event:"0")
    }
    @IBAction func buttonOne() {
        treatEvent(event:"1")
    }
    @IBAction func buttonTwo() {
        treatEvent(event:"2")
    }
    @IBAction func buttonThree() {
        treatEvent(event:"3")
    }
    @IBAction func buttonFour() {
        treatEvent(event:"4")
    }
    @IBAction func buttonFive() {
        treatEvent(event:"5")
    }
    @IBAction func buttonSix() {
        treatEvent(event:"6")
    }
    @IBAction func buttonSeven() {
        treatEvent(event:"7")
    }
    @IBAction func buttonEight() {
        treatEvent(event:"8")
    }
    @IBAction func buttonNine() {
        treatEvent(event:"9")
    }
    @IBAction func buttonClear() {
        treatEvent(event:"Clear")
    }
    @IBAction func buttonInvertSignal() {
        treatEvent(event:"Invert")
    }
    @IBAction func buttonPercentage() {
        treatEvent(event:"%")
    }
    @IBAction func buttonDivide() {
        treatEvent(event:"/")
    }
    @IBAction func buttonMultiply() {
        treatEvent(event:"x")
    }
    @IBAction func buttonMinus() {
        treatEvent(event:"-")
    }
    @IBAction func buttonPlus() {
        treatEvent(event:"+")
    }
    @IBAction func buttonPoint() {
        treatEvent(event:".")
    }
    @IBAction func buttonEquals() {
        treatEvent(event:"=")
    }
    
}
