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
        link("T-21")
        feature("Отображение пасхалки")
        severity("MINOR")
        
        calculationPage
            .enterNumberPI()
            .checkEasterEggAlertIsVisible()
            .tapEasterEggAlert()
    }
    
    func testEasterEggLabel() {
        link("T-22")
        feature("Содержание пасхалки")
        severity("MINOR")
        
        calculationPage
            .enterNumberPI()
            .checkEasterEggLabelText()
    }
}
