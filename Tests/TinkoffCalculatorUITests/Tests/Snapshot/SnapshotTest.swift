//
//  SnapshotTest.swift
//  TinkoffCalculator
//
//  Created by Sasha Stryapkov on 25.02.2024.
//

import iOSSnapshotTestCase

final class SnapshotTest: CommonTest {
    private let calculationPage = CalculationPage()
    private let historyPage = HistoryPage()
    
    func testCalculationScreenSnapshot() {
        verifyView(identifier: "imageCalculationScreen")
    }
    
    func testEasterEggAlertSnapshot() {
        calculationPage.enterNumberPI()
        let easterEggAlert = calculationPage.easterEggAlert
        Thread.sleep(forTimeInterval: 5)
        verifyElement(element: easterEggAlert, identifier: "imageEasterEggAlert")
    }
    
    func testHistoryCellSnapshot() {
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
        
        let lastHistoryCell = historyPage
                                    .historyCells
                                    .containing(NSPredicate(format: "identifier CONTAINS %@",
                                                            "historyCell_\(historyPage.historyCells.count - 1)"))
                                    .element
        
        verifyElement(element: lastHistoryCell, identifier: "imageHistoryCell")
    }
}
