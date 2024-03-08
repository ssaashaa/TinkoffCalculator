//
//  ClearTest.swift
//  TinkoffCalculatorUITests
//
//  Created by Sasha Stryapkov on 19.02.2024.
//

import XCTest

final class ClearTest: CommonTest {
    private let calculationPage = CalculationPage()
    
    func testClearButtonClick() {
        link("T-20")
        feature("Очистка результата")
        severity("BLOCKER")
        
        calculationPage
            .tapCommaButton()
            .tapDigitZeroButton()
            .tapDigitOneButton()
            .tapDigitTwoButton()
            .tapDigitThreeButton()
            .tapDigitFourButton()
            .tapDigitFiveButton()
            .tapDigitSixButton()
            .tapDigitSevenButton()
            .tapDigitEightButton()
            .tapDigitNineButton()
            .tapClearButton()
            .checkCalculationResultLabel("0")
    }
}
