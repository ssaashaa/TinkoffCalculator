//
//  HistoryPage.swift
//  TinkoffCalculatorUITests
//
//  Created by Sasha Stryapkov on 14.02.2024.
//

import XCTest

final class HistoryPage: CommonPage {
    private let nameOfhistoryPageNavBarBackButtonText = "Назад"
    private let nameOfHistoryPageNavBarText = "Прошлые вычисления"
    
    private lazy var backButton = app.navigationBars.children(matching: .button).firstMatch
    
    private lazy var nameOfHistoryPageNavbarTitle = app
                                                        .navigationBars[nameOfHistoryPageNavBarText]
                                                        .staticTexts[nameOfHistoryPageNavBarText]
                                                        .label

    private lazy var historyDateHeaders = app
                                            .tables
                                            .descendants(matching: .staticText)
                                            .containing(NSPredicate(format: "identifier CONTAINS %@", "sectionHeader_"))

    private lazy var historyCells = app
                                        .tables
                                        .cells
                                        .containing(NSPredicate(format: "identifier CONTAINS %@", "historyCell_"))

    @discardableResult
    func getBackFromHistoryPage() -> Self {
        backButton.tapElement()
        return self
    }
    
    @discardableResult
    func checkNavigationBarTitleOnHistoryPage() -> Self {
        XCTAssertTrue(nameOfHistoryPageNavbarTitle == nameOfHistoryPageNavBarText)
        return self
    }
    
    @discardableResult
    func checkNavigationBarBackButtonTitleOnHistoryPage() -> Self {
        XCTAssertTrue(backButton.label == nameOfhistoryPageNavBarBackButtonText)
        return self
    }
    
    @discardableResult
    func checkDateOfNewHeader(date: String) -> Self {
        let historyDateHeaderLabel = historyDateHeaders
                                                .element(matching: .staticText,
                                                         identifier: "sectionHeader_\(historyCells.count - 1)")
                                                .label

        XCTAssertTrue(historyDateHeaderLabel == date)
        return self
    }
    
    @discardableResult
    func checkNewResultLabel(result: String) -> Self {
        let resultLabel = historyCells
                                    .containing(NSPredicate(format: "identifier CONTAINS %@",
                                                            "historyCell_\(historyCells.count - 1)"))
                                    .descendants(matching: .staticText)
                                    .element(matching: .staticText,
                                             identifier: "resultLabel")
                                    .label
        XCTAssertTrue(resultLabel == result)
        return self
    }
    
    @discardableResult
    func checkNewExpressionLabel(expression: String) -> Self {
        let expressionLabel = historyCells
                                    .containing(NSPredicate(format: "identifier CONTAINS %@",
                                                            "historyCell_\(historyCells.count - 1)"))
                                    .descendants(matching: .staticText)
                                    .element(matching: .staticText,
                                             identifier: "expressionLabel")
                                    .label
        XCTAssertTrue(expressionLabel == expression)
        return self
    }
}
