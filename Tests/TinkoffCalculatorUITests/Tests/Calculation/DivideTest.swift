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
        link("T-15")
        feature("Деление целых чисел")
        severity("BLOCKER")
        
        calculationPage
            .tapDigitNineButton()
            .tapDigitEightButton()
        
            .tapDivideButton()
        
            .tapDigitSevenButton()
        
            .tapCalculateButton()
        
            .checkCalculationResultLabel("14")
    }
    
    func testDivideExpressionWithFractialNumbers() {
        link("T-16")
        feature("Деление дробных чисел")
        severity("NORMAL")
        
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
        link("T-17")
        feature("Деление нуля на число")
        severity("NORMAL")
        
        calculationPage
            .tapDivideButton()
        
            .tapDigitSevenButton()
        
            .tapCalculateButton()
        
            .checkCalculationResultLabel("0")
    }
    
    func testDivideExpressionByZero() {
        link("T-18")
        feature("Деление на ноль")
        severity("NORMAL")
        
        calculationPage
            .tapDigitEightButton()
            .tapDigitNineButton()
        
            .tapDivideButton()
        
            .tapDigitZeroButton()
        
            .tapCalculateButton()
        
            .checkCalculationResultLabel("Ошибка")
    }
    
    func testDivideExpressionWithNegativeNumber() {
        link("T-19")
        feature("Деление отрицательного числа")
        severity("NORMAL")
        
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
