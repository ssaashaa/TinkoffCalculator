//
//  CommonTest.swift
//  TinkoffCalculatorUITests
//
//  Created by Sasha Stryapkov on 07.02.2024.
//

import XCTest

class CommonTest: XCTestCase {
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        XCUIApplication().launch()
    }
}
