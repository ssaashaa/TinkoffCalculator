//
//  AddTest.swift
//  TinkoffCalculatorUITests
//
//  Created by Sasha Stryapkov on 19.02.2024.
//

import XCTest

final class AddTest: CommonTest {
    private let calculationPage = CalculationPage()
    
    func testAddExpressionWithWholeNumbers() {
        calculationPage
            .tapDigitOneButton()
            .tapDigitTwoButton()
        
            .tapAddButton()
        
            .tapDigitThreeButton()
            .tapDigitFourButton()
        
            .tapCalculateButton()
        
            .checkCalculationResultLabel("46")
    }
    
    func testAddExpressionWithFractialNumbers() {
        calculationPage
            .tapCommaButton()
            .tapDigitFiveButton()
            .tapDigitSixButton()
        
            .tapAddButton()
        
            .tapDigitZeroButton()
            .tapCommaButton()
            .tapDigitSevenButton()
            .tapDigitEightButton()
        
            .tapCalculateButton()
        
            .checkCalculationResultLabel("1,34")
    }
    
    func testAddExpressionWithZero() {
        calculationPage
            .tapDigitFourButton()
            .tapDigitFiveButton()
        
            .tapAddButton()
        
            .tapDigitZeroButton()
        
            .tapCalculateButton()
        
            .checkCalculationResultLabel("45")
    }
        
    func testAddExpressionWithNegativeNumber() {
        calculationPage
            .tapSubstractButton()
            
            .tapDigitSixButton()
            .tapDigitSevenButton()
        
            .tapCalculateButton()
        
            .tapAddButton()
        
            .tapDigitEightButton()
            .tapDigitNineButton()
        
            .tapCalculateButton()
        
            .checkCalculationResultLabel("22")
    }
}
