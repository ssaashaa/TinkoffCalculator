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
        link("T-3")
        feature("Сложение целых чисел")
        severity("BLOCKER")
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
        link("T-4")
        feature("Сложение дробных чисел")
        severity("NORMAL")
        
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
        link("T-5")
        feature("Сложение с нулём")
        severity("NORMAL")
        
        calculationPage
            .tapDigitFourButton()
            .tapDigitFiveButton()
        
            .tapAddButton()
        
            .tapDigitZeroButton()
        
            .tapCalculateButton()
        
            .checkCalculationResultLabel("45")
    }
        
    func testAddExpressionWithNegativeNumber() {
        link("T-6")
        feature("Сложение с отрицательным числом")
        severity("NORMAL")
        
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
