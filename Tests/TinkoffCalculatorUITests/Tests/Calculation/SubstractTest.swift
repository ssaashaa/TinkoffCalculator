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
        link("T-7")
        feature("Вычитание целых чисел")
        severity("BLOCKER")
        
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
        link("T-8")
        feature("Вычитание дробных чисел")
        severity("NORMAL")
        
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
        link("T-9")
        feature("Вычитание с нулём")
        severity("NORMAL")
        
        calculationPage
            .tapDigitTwoButton()
            .tapDigitThreeButton()
        
            .tapSubstractButton()
        
            .tapDigitZeroButton()
        
            .tapCalculateButton()
        
            .checkCalculationResultLabel("23")
    }
    
    func testSubstractExpressionWithNegativeNumber() {
        link("T-10")
        feature("Вычитание с отрицательным числом")
        severity("NORMAL")
        
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
