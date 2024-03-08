//
//  CommonPage.swift
//  TinkoffCalculatorUITests
//
//  Created by Sasha Stryapkov on 07.02.2024.
//

import XCTest

class CommonPage: XCTest {
    let app = XCUIApplication()
    
    @discardableResult
    func swipeUpFewTimes(times: Int) -> Self {
        var count = 0
        while count < times {
            step("Свайпаем вверх") {
                app.swipeUp()
            }
            count += 1
        }
        return self
    }
    
    @discardableResult
    func swipeDownFewTimes(times: Int) -> Self {
        var count = 0
        while count < times {
            step("Свайпаем вниз") {
                app.swipeDown()
            }
            count += 1
        }
        return self
    }
}
