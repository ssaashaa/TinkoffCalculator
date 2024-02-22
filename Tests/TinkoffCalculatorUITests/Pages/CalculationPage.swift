//
//  File.swift
//  TinkoffCalculatorUITests
//
//  Created by Sasha Stryapkov on 07.02.2024.
//

import XCTest

final class CalculationPage: CommonPage {
    private let nameOfCalculationPageNavBarText = "Калькулятор"
    private let easterEggLabelText = "Вы нашли пасхалку!"
    
    private lazy var nameOfCalculationPageNavbarTitle = app
                                                            .navigationBars[nameOfCalculationPageNavBarText]
                                                            .staticTexts[nameOfCalculationPageNavBarText]
                                                            .label
    
    private lazy var calculationLabel = app.staticTexts["calculationLabel"].label
    
    private lazy var easterEggAlert = app.otherElements["easterEgg"]
    
    private lazy var historyButton = app.buttons["historyButton"]
    private lazy var clearButton = app.buttons["clearButton"]
    
    private lazy var divideButton = app.buttons["divideButton"]
    private lazy var multiplyButton = app.buttons["multiplyButton"]
    private lazy var substractButton = app.buttons["substractButton"]
    private lazy var addButton = app.buttons["addButton"]
    private lazy var calculateButton = app.buttons["calculateButton"]
    
    private lazy var commaButton = app.buttons["commaButton"]
    
    private lazy var digitZeroButton = app.buttons["digitZeroButton"]
    private lazy var digitOneButton = app.buttons["digitOneButton"]
    private lazy var digitTwoButton = app.buttons["digitTwoButton"]
    private lazy var digitThreeButton = app.buttons["digitThreeButton"]
    private lazy var digitFourButton = app.buttons["digitFourButton"]
    private lazy var digitFiveButton = app.buttons["digitFiveButton"]
    private lazy var digitSixButton = app.buttons["digitSixButton"]
    private lazy var digitSevenButton = app.buttons["digitSevenButton"]
    private lazy var digitEightButton = app.buttons["digitEightButton"]
    private lazy var digitNineButton = app.buttons["digitNineButton"]
    
    @discardableResult
    func tapHistoryButton() -> Self {
        historyButton.tapElement()
        return self
    }
    
    @discardableResult
    func tapClearButton() -> Self {
        clearButton.tapElement()
        return self
    }
    
    @discardableResult
    func tapDivideButton() -> Self {
        divideButton.tapElement()
        return self
    }
    
    @discardableResult
    func tapMultiplyButton() -> Self {
        multiplyButton.tapElement()
        return self
    }
    
    @discardableResult
    func tapSubstractButton() -> Self {
        substractButton.tapElement()
        return self
    }
    
    @discardableResult
    func tapAddButton() -> Self {
        addButton.tapElement()
        return self
    }
    
    @discardableResult
    func tapCalculateButton() -> Self {
        calculateButton.tapElement()
        return self
    }
    
    @discardableResult
    func tapCommaButton() -> Self {
        commaButton.tapElement()
        return self
    }
    
    @discardableResult
    func tapDigitZeroButton() -> Self {
        digitZeroButton.tapElement()
        return self
    }
    
    @discardableResult
    func tapDigitOneButton() -> Self {
        digitOneButton.tapElement()
        return self
    }
    
    @discardableResult
    func tapDigitTwoButton() -> Self {
        digitTwoButton.tapElement()
        return self
    }
    
    @discardableResult
    func tapDigitThreeButton() -> Self {
        digitThreeButton.tapElement()
        return self
    }
    
    @discardableResult
    func tapDigitFourButton() -> Self {
        digitFourButton.tapElement()
        return self
    }
    
    @discardableResult
    func tapDigitFiveButton() -> Self {
        digitFiveButton.tapElement()
        return self
    }
    
    @discardableResult
    func tapDigitSixButton() -> Self {
        digitSixButton.tapElement()
        return self
    }
    
    @discardableResult
    func tapDigitSevenButton() -> Self {
        digitSevenButton.tapElement()
        return self
    }
    
    @discardableResult
    func tapDigitEightButton() -> Self {
        digitEightButton.tapElement()
        return self
    }
    
    @discardableResult
    func tapDigitNineButton() -> Self {
        digitNineButton.tapElement()
        return self
    }
    
    @discardableResult
    func tapEasterEggAlert() -> Self {
        easterEggAlert.tapElement()
        return self
    }
    
    @discardableResult
    func enterNumberPI() -> Self {
        tapDigitThreeButton()
        tapCommaButton()
        tapDigitOneButton()
        tapDigitFourButton()
        tapDigitOneButton()
        tapDigitFiveButton()
        tapDigitNineButton()
        tapDigitTwoButton()
        return self
    }
    
    @discardableResult
    func checkNavigationBarTitleOnCalculationPage() -> Self {
        XCTAssertTrue(nameOfCalculationPageNavbarTitle == nameOfCalculationPageNavBarText)
        return self
    }
    
    @discardableResult
    func checkCalculationResultLabel(_ result: String) -> Self {
        XCTAssertTrue(calculationLabel == result)
        return self
    }
    
    @discardableResult
    func checkEasterEggAlertIsVisible() -> Self {
        XCTAssertTrue(easterEggAlert.isEnabled)
        return self
    }
    
    @discardableResult
    func checkEasterEggLabelText() -> Self {
        let easterEggAlertLabel = easterEggAlert.descendants(matching: .staticText).firstMatch.label
        XCTAssertTrue(easterEggAlertLabel == easterEggLabelText)
        return self
    }
}
