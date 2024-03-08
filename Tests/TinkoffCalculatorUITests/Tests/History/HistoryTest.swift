//
//  HistoryTest.swift
//  TinkoffCalculatorUITests
//
//  Created by Sasha Stryapkov on 19.02.2024.
//

import XCTest

final class HistoryTest: CommonTest {
    private let calculationPage = CalculationPage()
    private let historyPage = HistoryPage()
    
    func testHistoryPageNavigationBarLabels() {
        link("T-23")
        feature("Отображение экрана \"Прошлые вычисления\"")
        severity("BLOCKER")
        
        calculationPage
            .tapHistoryButton()
        
        historyPage
            .checkNavigationBarBackButtonTitleOnHistoryPage()
            .checkNavigationBarTitleOnHistoryPage()
    }
    
    func testHistoryButtonClick() {
        link("T-24")
        feature("Работоспобность кнопки \"Прошлые вычисления\"")
        severity("BLOCKER")
        
        calculationPage
            .tapHistoryButton()
        
        historyPage
            .getBackFromHistoryPage()
    }
    
    func testHistoryDateHeaderAfterMakingExperssion() {
        link("T-25")
        feature("Отображение даты вычисления в истории вычислений")
        severity("NORMAL")
        
        calculationPage
            .tapDigitOneButton()
            .tapAddButton()
            .tapDigitTwoButton()
            .tapCalculateButton()
            
        let currentDate = Date().getCurrentDate(Date())
        
        calculationPage
            .tapHistoryButton()
        
        historyPage
            .swipeUpFewTimes(times: 5)
            .checkDateOfNewHeader(date: currentDate)
    }
    
    func testHistoryCellResultLabelAfterMakingExperssion() {
        link("T-26")
        feature("Отображение результата вычисления в истории вычислений")
        severity("NORMAL")
        
        calculationPage
            .tapDigitFiveButton()
            .tapDigitFourButton()
        
            .tapSubstractButton()
        
            .tapDigitThreeButton()
            .tapDigitTwoButton()
        
            .tapCalculateButton()
        
            .tapHistoryButton()
        
        historyPage
            .swipeUpFewTimes(times: 5)
            .checkNewResultLabel(result: "22.0")
    }
    
    func testHistoryCellExpressionLabelAfterMakingExperssion() {
        link("T-27")
        feature("Отображение вычисления в истории вычислений")
        severity("NORMAL")
        
        calculationPage
            .tapDigitSixButton()
        
            .tapMultiplyButton()
        
            .tapDigitSevenButton()
            .tapDigitEightButton()
        
            .tapCalculateButton()
        
            .tapHistoryButton()
        
        historyPage
            .swipeUpFewTimes(times: 5)
            .checkNewExpressionLabel(expression: "6.0 x 78.0 ")
    }
}
