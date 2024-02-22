//
//  SubstractTest.swift
//  TinkoffCalculatorUITests
//
//  Created by Sasha Stryapkov on 19.02.2024.
//

import XCTest

final class SubstractTest: CommonTest {
    private let calculationPage = CalculationPage()
    
    func testSubstractExpressionWithWholeNumbers() {
        calculationPage
            .tapDigitTwoButton()
            .tapDigitThreeButton()
        
            .tapSubstractButton()
        
            .tapDigitOneButton()
            .tapDigitFourButton()
        
            .tapCalculateButton()
        
            .checkCalculationResultLabel("9")
    }
    
    func testSubstractExpressionWithFractialNumbers() {
        calculationPage
            .tapCommaButton()
            .tapDigitFiveButton()
            .tapDigitSixButton()
            .tapDigitSevenButton()
        
            .tapSubstractButton()
        
            .tapDigitZeroButton()
            .tapCommaButton()
            .tapDigitTwoButton()
            .tapDigitEightButton()
            .tapDigitNineButton()
        
            .tapCalculateButton()
        
            .checkCalculationResultLabel("0,278")
    }
    
    func testSubstractExpressionWithZero() {
        calculationPage
            .tapDigitTwoButton()
            .tapDigitThreeButton()
        
            .tapSubstractButton()
        
            .tapDigitZeroButton()
        
            .tapCalculateButton()
        
            .checkCalculationResultLabel("23")
    }
    
    func testSubstractExpressionWithNegativeNumber() {
        calculationPage
            .tapSubstractButton()
            
            .tapDigitFourButton()
            .tapDigitFiveButton()
        
            .tapCalculateButton()
        
            .tapSubstractButton()
        
            .tapDigitSixButton()
            .tapDigitSevenButton()
        
            .tapCalculateButton()
        
            .checkCalculationResultLabel("-112")
    }
}
