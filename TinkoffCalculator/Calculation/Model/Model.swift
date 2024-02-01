//
//  Model.swift
//  TinkoffCalculator
//
//  Created by Sasha Stryapkov on 01.02.2024.
//

import Foundation

enum CalculationError: Error {
    case dividedByZero
    case notANumber
    case tooLarge
    case tooSmall
    case wrongInput
}

enum Operation: String {
    case add = "+"
    case substract = "-"
    case multiply = "x"
    case divide = "/"
    
    func calculate(_ number1: Double, _ number2: Double) throws -> Double {
        switch self {
        case .add:
            if number1 + number2 > Double.greatestFiniteMagnitude {
                throw CalculationError.tooLarge
            }
            
            return number1 + number2
            
        case .substract:
            if number1 - number2 < -Double.greatestFiniteMagnitude {
                throw CalculationError.tooLarge
            }
            
            return number1 - number2
            
        case .multiply:
            if number1 * number2 > Double.greatestFiniteMagnitude {
                throw CalculationError.tooLarge
            }
            
            return number1 * number2
            
        case .divide:
            if number2 == 0 {
                throw CalculationError.dividedByZero
            }
            
            return number1 / number2
        }
    }
}

enum CalculationHistoryItem {
    case number(Double)
    case operation(Operation)
}
