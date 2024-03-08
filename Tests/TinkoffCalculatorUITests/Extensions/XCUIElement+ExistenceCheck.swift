//
//  XCUIElement+ExistenceCheck.swift
//  TinkoffCalculatorUITests
//
//  Created by Sasha Stryapkov on 15.02.2024.
//

import XCTest

extension XCUIElement {
    func tapElement() {
        checkExistence()
        self.tap()
    }
    
    func checkExistence(_ isExists: Bool = true) {
        XCTAssertEqual(isExists,
                       self.waitForExistence(timeout: 0.5),
                       "Element exist should be \(isExists) but now is \(self.exists)")
    }
}
