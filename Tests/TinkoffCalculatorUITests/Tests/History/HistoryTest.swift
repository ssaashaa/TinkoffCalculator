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
        calculationPage
            .tapHistoryButton()
        
        historyPage
            .checkNavigationBarBackButtonTitleOnHistoryPage()
            .checkNavigationBarTitleOnHistoryPage()
    }
    
    func testHistoryButtonClick() {
        calculationPage
            .tapHistoryButton()
        
        historyPage
            .getBackFromHistoryPage()
    }
    
    func testHistoryDateHeaderAfterMakingExperssion() {
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
