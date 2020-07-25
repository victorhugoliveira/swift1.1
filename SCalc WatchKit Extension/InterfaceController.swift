//
//  InterfaceController.swift
//  Simple Calculator WatchKit Extension
//
//  Created by Plinio Vilela on 29/04/19.
//  Copyright © 2019 Plinio Vilela. All rights reserved.
//

import WatchKit
import Foundation

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
    

    func treatEvent(event : String){
        let result = model.treatEvent(event: event)
        
        numberOnDisplay.setText(result.getNumberToDisplay())
        statusLabel.setText(result.getStatusToDisplay())
    }
    
}
