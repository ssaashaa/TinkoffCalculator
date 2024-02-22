//
//  DivideTest.swift
//  TinkoffCalculatorUITests
//
//  Created by Sasha Stryapkov on 19.02.2024.
//

import XCTest

final class DivideTest: CommonTest {
    private let calculationPage = CalculationPage()
    
    func testDivideExpressionWithWholeNumbers() {
        calculationPage
            .tapDigitNineButton()
            .tapDigitEightButton()
        
            .tapDivideButton()
        
            .tapDigitSevenButton()
        
            .tapCalculateButton()
        
            .checkCalculationResultLabel("14")
    }
    
    func testDivideExpressionWithFractialNumbers() {
        calculationPage
            .tapCommaButton()
            .tapDigitOneButton()
            .tapDigitTwoButton()
        
            .tapDivideButton()
        
            .tapDigitZeroButton()
            .tapCommaButton()
            .tapDigitSixButton()
        
            .tapCalculateButton()
        
            .checkCalculationResultLabel("0,2")
    }
    
    func testDivideExpressionWithZero() {
        calculationPage
            .tapDivideButton()
        
            .tapDigitSevenButton()
        
            .tapCalculateButton()
        
            .checkCalculationResultLabel("0")
    }
    
    func testDivideExpressionByZero() {
        calculationPage
            .tapDigitEightButton()
            .tapDigitNineButton()
        
            .tapDivideButton()
        
            .tapDigitZeroButton()
        
            .tapCalculateButton()
        
            .checkCalculationResultLabel("Ошибка")
    }
    
    func testDivideExpressionWithNegativeNumber() {
        calculationPage
            .tapSubstractButton()
    
            .tapDigitNineButton()
            .tapDigitEightButton()
        
            .tapDivideButton()
        
            .tapDigitOneButton()
            .tapDigitFourButton()
        
            .tapCalculateButton()
        
            .checkCalculationResultLabel("-7")
    }
}
