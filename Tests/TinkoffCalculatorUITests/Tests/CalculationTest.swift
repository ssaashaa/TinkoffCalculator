//
//  File.swift
//  TinkoffCalculatorUITests
//
//  Created by Sasha Stryapkov on 07.02.2024.
//

import XCTest

class CalculationTest: CommonTest {
    private let calculationPage = CalculationPage()
    
    func testHistoryButtonClick() {
        calculationPage.tapHistoryButton()
    }
}
