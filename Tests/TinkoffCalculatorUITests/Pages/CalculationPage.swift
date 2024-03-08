//
//  CalculationPage.swift
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
    
    lazy var easterEggAlert = app.otherElements["easterEgg"]
    
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
        step("Тап по кнопке \"Прошлые вычисления\"") {
            historyButton.tapElement()
        }
        return self
    }
    
    @discardableResult
    func tapClearButton() -> Self {
        step("Тап по кнопке \"Очистить\"") {
            clearButton.tapElement()
        }
        return self
    }
    
    @discardableResult
    func tapDivideButton() -> Self {
        step("Тап по кнопке \"Разделить\"") {
            divideButton.tapElement()
        }
        return self
    }
    
    @discardableResult
    func tapMultiplyButton() -> Self {
        step("Тап по кнопке \"Умножить\"") {
            multiplyButton.tapElement()
        }
        return self
    }
    
    @discardableResult
    func tapSubstractButton() -> Self {
        step("Тап по кнопке \"Вычесть\"") {
            substractButton.tapElement()
        }
        return self
    }
    
    @discardableResult
    func tapAddButton() -> Self {
        step("Тап по кнопке \"Сложить\"") {
            addButton.tapElement()
        }
        return self
    }
    
    @discardableResult
    func tapCalculateButton() -> Self {
        step("Тап по кнопке \"Вычислить\"") {
            calculateButton.tapElement()
        }
        return self
    }
    
    @discardableResult
    func tapCommaButton() -> Self {
        step("Тап по кнопке \"Запятая\"") {
            commaButton.tapElement()
        }
        
        return self
    }
    
    @discardableResult
    func tapDigitZeroButton() -> Self {
        step("Тап по кнопке \"Ноль\"") {
            digitZeroButton.tapElement()
        }
        return self
    }
    
    @discardableResult
    func tapDigitOneButton() -> Self {
        step("Тап по кнопке \"Один\"") {
            digitOneButton.tapElement()
        }
        return self
    }
    
    @discardableResult
    func tapDigitTwoButton() -> Self {
        step("Тап по кнопке \"Два\"") {
            digitTwoButton.tapElement()
        }
        return self
    }
    
    @discardableResult
    func tapDigitThreeButton() -> Self {
        step("Тап по кнопке \"Три\"") {
            digitThreeButton.tapElement()
        }
        return self
    }
    
    @discardableResult
    func tapDigitFourButton() -> Self {
        step("Тап по кнопке \"Четыре\"") {
            digitFourButton.tapElement()
        }
        return self
    }
    
    @discardableResult
    func tapDigitFiveButton() -> Self {
        step("Тап по кнопке \"Пять\"") {
            digitFiveButton.tapElement()
        }
        return self
    }
    
    @discardableResult
    func tapDigitSixButton() -> Self {
        step("Тап по кнопке \"Шесть\"") {
            digitSixButton.tapElement()
        }
        return self
    }
    
    @discardableResult
    func tapDigitSevenButton() -> Self {
        step("Тап по кнопке \"Семь\"") {
            digitSevenButton.tapElement()
        }
        return self
    }
    
    @discardableResult
    func tapDigitEightButton() -> Self {
        step("Тап по кнопке \"Восемь\"") {
            digitEightButton.tapElement()
        }
        return self
    }
    
    @discardableResult
    func tapDigitNineButton() -> Self {
        step("Тап по кнопке \"Девять\"") {
            digitNineButton.tapElement()
        }
        return self
    }
    
    @discardableResult
    func tapEasterEggAlert() -> Self {
        step("Тап по алёрту \"Пасхалка\"") {
            easterEggAlert.tapElement()
        }
        return self
    }
    
    @discardableResult
    func enterNumberPI() -> Self {
        step("Ввод числа Pi") {
            tapDigitThreeButton()
            tapCommaButton()
            tapDigitOneButton()
            tapDigitFourButton()
            tapDigitOneButton()
            tapDigitFiveButton()
            tapDigitNineButton()
            tapDigitTwoButton()
        }
        return self
    }
    
    @discardableResult
    func checkNavigationBarTitleOnCalculationPage() -> Self {
        step("Проверка имени экрана в панели навигации") {
            XCTAssertTrue(nameOfCalculationPageNavbarTitle == nameOfCalculationPageNavBarText)
        }
        return self
    }
    
    @discardableResult
    func checkCalculationResultLabel(_ result: String) -> Self {
        step("Проверка отображения результата в лейбле") {
            XCTAssertTrue(calculationLabel == result)
        }
        return self
    }
    
    @discardableResult
    func checkEasterEggAlertIsVisible() -> Self {
        step("Проверка отображения пасхалки на экране") {
            XCTAssertTrue(easterEggAlert.isEnabled)
        }
        return self
    }
    
    @discardableResult
    func checkEasterEggLabelText() -> Self {
        var easterEggAlertLabel = String()
        
        step("Поиск лейбла пасхалки в приложении") {
            easterEggAlertLabel = easterEggAlert.descendants(matching: .staticText).firstMatch.label
        }
        
        step("Проверка содержания текста в пасхалке") {
            XCTAssertTrue(easterEggAlertLabel == easterEggLabelText)
        }
        return self
    }
}
