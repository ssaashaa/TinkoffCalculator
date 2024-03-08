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

    lazy var historyCells = app
                                        .tables
                                        .cells
                                        .containing(NSPredicate(format: "identifier CONTAINS %@", "historyCell_"))

    @discardableResult
    func getBackFromHistoryPage() -> Self {
        step("Тап по кнопке \"Назад\"") {
            backButton.tapElement()
        }
        return self
    }
    
    @discardableResult
    func checkNavigationBarTitleOnHistoryPage() -> Self {
        step("Проверка имени экрана в панели навигации") {
            XCTAssertTrue(nameOfHistoryPageNavbarTitle == nameOfHistoryPageNavBarText)
        }
        return self
    }
    
    @discardableResult
    func checkNavigationBarBackButtonTitleOnHistoryPage() -> Self {
        step("Проверка имени кнопки возврата с экрана в панели навигации") {
            XCTAssertTrue(backButton.label == nameOfhistoryPageNavBarBackButtonText)
        }
        return self
    }
    
    @discardableResult
    func checkDateOfNewHeader(date: String) -> Self {
        var historyDateHeaderLabel = String()
        
        step("Поиск даты вычисления в приложении") {
            historyDateHeaderLabel = historyDateHeaders
                                                    .element(matching: .staticText,
                                                             identifier: "sectionHeader_\(historyCells.count - 1)")
                                                    .label
        }
        
        step("Проверка отображаемой даты вычисления") {
            XCTAssertTrue(historyDateHeaderLabel == date)
        }
        return self
    }
    
    @discardableResult
    func checkNewResultLabel(result: String) -> Self {
        var resultLabel = String()
        
        step("Поиск лейбла результата в приложении") {
            resultLabel = historyCells
                                    .containing(NSPredicate(format: "identifier CONTAINS %@",
                                                            "historyCell_\(historyCells.count - 1)"))
                                    .descendants(matching: .staticText)
                                    .element(matching: .staticText,
                                             identifier: "resultLabel")
                                    .label
        }
    
        step("Проверка отображаемого результата вычисления") {
            XCTAssertTrue(resultLabel == result)
        }
        return self
    }
    
    @discardableResult
    func checkNewExpressionLabel(expression: String) -> Self {
        var expressionLabel = String()
        
        step("Поиск лейбла с выражением в приложении") {
            expressionLabel = historyCells
                                    .containing(NSPredicate(format: "identifier CONTAINS %@",
                                                            "historyCell_\(historyCells.count - 1)"))
                                    .descendants(matching: .staticText)
                                    .element(matching: .staticText,
                                             identifier: "expressionLabel")
                                    .label
        }
    
        step("Проверка отображаемого вычисления") {
            XCTAssertTrue(expressionLabel == expression)
        }
        return self
    }
}
