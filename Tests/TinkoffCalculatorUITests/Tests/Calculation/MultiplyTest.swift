//
//  MultiplyTest.swift
//  TinkoffCalculatorUITests
//
//  Created by Sasha Stryapkov on 19.02.2024.
//

import XCTest

final class MultiplyTest: CommonTest {
    private let calculationPage = CalculationPage()
    
    func testMultiplyExpressionWithWholeNumbers() {
        calculationPage
            .tapDigitTwoButton()
            .tapDigitThreeButton()
        
            .tapMultiplyButton()
        
            .tapDigitFiveButton()
            .tapDigitSixButton()
        
            .tapCalculateButton()
        
            .checkCalculationResultLabel("1288")
    }
    
    func testMultiplyExpressionWithFractialNumbers() {
        calculationPage
            .tapCommaButton()
            .tapDigitSevenButton()
            .tapDigitEightButton()
        
            .tapMultiplyButton()
            
            .tapDigitZeroButton()
            .tapCommaButton()
            .tapDigitNineButton()
            .tapDigitOneButton()
        
            .tapCalculateButton()
        
            .checkCalculationResultLabel("0,71")
    }
    
    func testMultiplyExpressionWithZero() {
        calculationPage
            .tapDigitTwoButton()
            .tapDigitThreeButton()
        
            .tapMultiplyButton()
        
            .tapDigitZeroButton()
        
            .tapCalculateButton()
        
            .checkCalculationResultLabel("0")
    }
    
    func testMultiplyExpressionWithNegativeNumber() {
        calculationPage
            .tapSubstractButton()
            
            .tapDigitFourButton()
            .tapDigitFiveButton()
        
            .tapCalculateButton()
        
            .tapMultiplyButton()
        
            .tapDigitSixButton()
            .tapDigitSevenButton()
        
            .tapCalculateButton()
        
            .checkCalculationResultLabel("-3015")
    }
}
