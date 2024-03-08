//
//  XCTest+Annotations.swift
//  TinkoffCalculatorUITests
//
//  Created by Sasha Stryapkov on 06.03.2024.
//

import XCTest

extension XCTest {
    func feature(_ values: String...) {
        label(name: "feature", values: values)
    }
    
    private func label(name: String, values: [String]) {
        for value in values {
            XCTContext.runActivity(named: "allure.label." + name + ":" + value, block: { _ in })
        }
    }
    
    func link(_ value: String) {
        links(name: value, values: ["https://jira.*.ru/testCase/" + value])
    }
    
    private func links(name: String, values: [String]) {
        for value in values {
            XCTContext.runActivity(named: "allure.link." + name + ":" + value, block: { _ in })
        }
    }
    
    func story(_ stories: String...) {
        label(name: "story", values: stories)
    }
    
    func severity(_ values: String...) {
        label(name: "severity", values: values)
    }
    
    func step(_ name: String, step: () -> Void) {
        XCTContext.runActivity(named: name) { _ in
            step()
        }
    }
}
