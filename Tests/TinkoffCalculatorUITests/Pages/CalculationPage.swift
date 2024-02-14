//
//  File.swift
//  TinkoffCalculatorUITests
//
//  Created by Sasha Stryapkov on 07.02.2024.
//

import XCTest

class CalculationPage: CommonPage {
    private lazy var historyButton = app.buttons["historyButton"]
    
    func tapHistoryButton() {
        historyButton.tap()
    }
}
