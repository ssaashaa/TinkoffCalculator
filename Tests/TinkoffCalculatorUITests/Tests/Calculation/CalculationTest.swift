//
//  CalculationTest.swift
//  TinkoffCalculatorUITests
//
//  Created by Sasha Stryapkov on 19.02.2024.
//

import XCTest

final class CalculationTest: CommonTest {
    private let calculationPage = CalculationPage()
    
    func testCalculationPageLabels() {
        link("T-1")
        feature("Отображение экрана \"Калькулятор\"")
        severity("BLOCKER")
        
        calculationPage
            .checkNavigationBarTitleOnCalculationPage()
            .checkCalculationResultLabel("0")
    }
    
    func testCalculationPageButtons() {
        link("T-2")
        feature("Работоспобность кнопок на экране \"Калькулятор\"")
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
            .checkCalculationResultLabel("0,0123456789")

            .tapClearButton()
            .tapDivideButton()
            .tapMultiplyButton()
            .tapSubstractButton()
            .tapAddButton()
            .tapCalculateButton()
        
            .tapHistoryButton()
    }
}
