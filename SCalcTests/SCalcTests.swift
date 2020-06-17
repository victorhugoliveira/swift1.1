//
//  SCalcTests.swift
//  SCalcTests
//
//  Created by Plinio Vilela on 03/05/19.
//  Copyright © 2019 Plinio Vilela. All rights reserved.
//

import XCTest
@testable import SCalc

class SCalcTests: XCTestCase {
    var model : Model!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        model = Model()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // 01
    func testPlusOperation_01() {
        var str = ""
        // 1. given
        str = model.treatEvent(event:"2")
        str = model.treatEvent(event:"+")
        str = model.treatEvent(event:"2")
        // 2. when
        str = model.treatEvent(event:"=")
        // 3. then
        XCTAssertEqual(str, "4.0", "2+2=4")
    }

    // 02
    func testPlusOperation_02() {
        var str = ""
        // 1. given
        str = model.treatEvent(event:"2")
        str = model.treatEvent(event:"3")
        str = model.treatEvent(event:"+")
        str = model.treatEvent(event:"2")
        // 2. when
        str = model.treatEvent(event:"=")
        // 3. then
        XCTAssertEqual(str, "25.0", "23+2=25")
    }
    
    // 03
    func testRejectInitialZeros() {
        var str = ""
        // 1. given
        str = model.treatEvent(event:"0")
        str = model.treatEvent(event:"0")
        str = model.treatEvent(event:"0")
        str = model.treatEvent(event:"0")
        // 2. when
        str = model.treatEvent(event:"0")
        // 3. then
        XCTAssertEqual(str, "0", "Initial zeros are ignored")
    }
    
    // 04
    func testRejectDoublePoints() {
        var str = ""
        // 1. given
        str = model.treatEvent(event:"0")
        str = model.treatEvent(event:".")
        str = model.treatEvent(event:"0")
        str = model.treatEvent(event:".")
        // 2. when
        str = model.treatEvent(event:"1")
        // 3. then
        XCTAssertEqual(str, "0.01", "Double points are ignored")
    }
    
    // 05
    func testRejectDoublePointsSecondNumber() {
        var str = ""
        // 1. given
        str = model.treatEvent(event:"0")
        str = model.treatEvent(event:".")
        str = model.treatEvent(event:"0")
        str = model.treatEvent(event:".")
        str = model.treatEvent(event:"1")
        str = model.treatEvent(event:"+")
        str = model.treatEvent(event:".")
        str = model.treatEvent(event:"0")
        str = model.treatEvent(event:".")
        str = model.treatEvent(event:"1")
        // 2. when
        str = model.treatEvent(event:"=")
        // 3. then
        XCTAssertEqual(str, "0.02", "Double points are ignored second number too")
    }
    
    // 06
    func testRejectDoubleEquals() {
        var str = ""
        // 1. given
        str = model.treatEvent(event:"0")
        str = model.treatEvent(event:"1")
        str = model.treatEvent(event:"2")
        str = model.treatEvent(event:"+")
        str = model.treatEvent(event:"2")
        str = model.treatEvent(event:"+")
        str = model.treatEvent(event:"-")
        str = model.treatEvent(event:"3")
        str = model.treatEvent(event:"=")
        str = model.treatEvent(event:"=")
        // 2. when
        str = model.treatEvent(event:"=")
        // 3. then
        XCTAssertEqual(str, "11", "Multiple operations, consider the last. Ignore multiple equals.")
    }
    
    // 07
    func testAppendAfterAnOperation() {
        var str = ""
        // 1. given
        str = model.treatEvent(event:"1")
        str = model.treatEvent(event:"2")
        str = model.treatEvent(event:"3")
        str = model.treatEvent(event:"-")
        str = model.treatEvent(event:"2")
        str = model.treatEvent(event:"3")
        str = model.treatEvent(event:"=")
        str = model.treatEvent(event:"1")
        str = model.treatEvent(event:"+")
        str = model.treatEvent(event:"1")
        str = model.treatEvent(event:"=")
        // 2. when
        str = model.treatEvent(event:"=")
        // 3. then
        XCTAssertEqual(str, "1002", "Append to 100 -> 1001 + 1 = 1002.")
    }
    
    // 08
    func testSecondNumberDecimal() {
        var str = ""
        // 1. given
        str = model.treatEvent(event:"1")
        str = model.treatEvent(event:"2")
        str = model.treatEvent(event:"3")
        str = model.treatEvent(event:"-")
        str = model.treatEvent(event:"2")
        str = model.treatEvent(event:"3")
        str = model.treatEvent(event:".")
        str = model.treatEvent(event:"3")
        str = model.treatEvent(event:"+")
        str = model.treatEvent(event:"1")
        //str = model.treatEvent(event:"=")
        // 2. when
        str = model.treatEvent(event:"=")
        // 3. then
        XCTAssertEqual(str, "100.7", "Second number is a decimal")
    }
 
    
    // 09
    func testNegativeNumbers() {
        var str = ""
        // 1. given
        str = model.treatEvent(event:"-")
        str = model.treatEvent(event:"2")
        str = model.treatEvent(event:"3")
        str = model.treatEvent(event:"+")
        str = model.treatEvent(event:"3")
        str = model.treatEvent(event:"0")
        str = model.treatEvent(event:"=")
        str = model.treatEvent(event:"-")
        str = model.treatEvent(event:"2")
        str = model.treatEvent(event:"1")
        str = model.treatEvent(event:"=")
        // 2. when
        str = model.treatEvent(event:"=")
        // 3. then
        XCTAssertEqual(str, "-14", "Resultado negativo")
    }
    
    // 10
    func testLimits() {
        var str = ""
        // 1. given
        str = model.treatEvent(event:"9")
        str = model.treatEvent(event:"9")
        str = model.treatEvent(event:"9")
        str = model.treatEvent(event:"9")
        str = model.treatEvent(event:"9")
        str = model.treatEvent(event:"9")
        str = model.treatEvent(event:"9")
        str = model.treatEvent(event:"9")
        str = model.treatEvent(event:"9")
        str = model.treatEvent(event:"9")
        str = model.treatEvent(event:"9")
        str = model.treatEvent(event:"9")
        str = model.treatEvent(event:"+")
        str = model.treatEvent(event:"1")
        str = model.treatEvent(event:"=")
        // 2. when
        str = model.treatEvent(event:"=")
        // 3. then
        XCTAssertEqual(str, "1000000000000", "Treze digitos, nao aceita...")
    }
    
}
