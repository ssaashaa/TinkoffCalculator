//
//  EasterEggTest.swift
//  TinkoffCalculatorUITests
//
//  Created by Sasha Stryapkov on 20.02.2024.
//

import XCTest

final class EasterEggTest: CommonTest {
    private let calculationPage = CalculationPage()
    
    func testEasterEggAppearanceAndDissapearance() {
        calculationPage
            .enterNumberPI()
            .checkEasterEggAlertIsVisible()
            .tapEasterEggAlert()
    }
    
    func testEasterEggLabel() {
        calculationPage
            .enterNumberPI()
            .checkEasterEggLabelText()
    }
}
