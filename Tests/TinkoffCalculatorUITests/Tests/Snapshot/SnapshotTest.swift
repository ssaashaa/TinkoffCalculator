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
        link("T-28")
        feature("Отображение экрана \"Калькулятор\"")
        severity("NORMAL")
        
        verifyView(identifier: "imageCalculationScreen")
    }
    
    func testEasterEggAlertSnapshot() {
        link("T-29")
        feature("Отображение пасхалки")
        severity("MINOR")
        
        calculationPage.enterNumberPI()
        let easterEggAlert = calculationPage.easterEggAlert
        Thread.sleep(forTimeInterval: 5)
        verifyElement(element: easterEggAlert, identifier: "imageEasterEggAlert")
    }
    
    func testHistoryCellSnapshot() {
        link("T-30")
        feature("Отображение ячейки вычислений в истории вычислений")
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
        
        let lastHistoryCell = historyPage
                                    .historyCells
                                    .containing(NSPredicate(format: "identifier CONTAINS %@",
                                                            "historyCell_\(historyPage.historyCells.count - 1)"))
                                    .element
        
        verifyElement(element: lastHistoryCell, identifier: "imageHistoryCell")
    }
}
