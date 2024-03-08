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
        link("T-11")
        feature("Умножение целых чисел")
        severity("BLOCKER")
        
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
        link("T-12")
        feature("Умножение дробных чисел")
        severity("NORMAL")
        
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
        link("T-13")
        feature("Умножение на ноль")
        severity("NORMAL")
        
        calculationPage
            .tapDigitTwoButton()
            .tapDigitThreeButton()
        
            .tapMultiplyButton()
        
            .tapDigitZeroButton()
        
            .tapCalculateButton()
        
            .checkCalculationResultLabel("0")
    }
    
    func testMultiplyExpressionWithNegativeNumber() {
        link("T-14")
        feature("Умножение отрицательного числа")
        severity("NORMAL")
        
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
