//
//  ViewController.swift
//  TinkoffCalculator
//
//  Created by Sasha Stryapkov on 26.01.2024.
//

import UIKit

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
            if number1 - number2 < -Double.greatestFiniteMagnitude{
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

class ViewController: UIViewController {
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        guard let buttonText = sender.currentTitle else { return }
        
        // Added condition to check if there were any number before
        if enteredNumber != 0 {
            resetLabelText()
        }
        
        // Added condition to check if label.text contains some weird stuff
        
        if let calcLabelText = label.text {
            for char in calcLabelText {
                if !char.isNumber && char != "," {
                    resetLabelText()
                    break
                }
            }
        }
        
        if buttonText == "," && label.text?.contains(",") == true {
            return
        }
        
        if label.text == "0" {
            if buttonText == "," {
                label.text = "0,"
            } else {
                label.text = buttonText
            }
        } else {
            label.text?.append(buttonText)
        }
        
    }
    
    @IBAction func operationButtonPressed(_ sender: UIButton) {
        guard
            let buttonText = sender.currentTitle,
            let buttonOperation = Operation(rawValue: buttonText)
        else { return }
        
        guard
            let labelText = label.text,
            let labelNumber = numberFormatter.number(from: labelText)?.doubleValue
        else { return }
        
        if labelNumber != enteredNumber || calculationHistory.isEmpty {
            calculationHistory.append(.number(labelNumber))
            calculationHistory.append(.operation(buttonOperation))
        } else {
            calculationHistory.removeLast()
            calculationHistory.append(.operation(buttonOperation))
        }

        updateLabelText(labelNumber)
    }
    
    @IBAction func clearButtonPressed() {
        calculationHistory.removeAll()
        resetPreviousNumber()
        resetLabelText()
    }
    
    @IBAction func calculateButtonPressed() {
        guard
            let labelText = label.text,
            let labelNumber = numberFormatter.number(from: labelText)?.doubleValue
        else { return }
        
        calculationHistory.append(.number(labelNumber))
        
        do {
            let result = try calculate()
            //      Tinkoff Solution
            //            label.text = numberFormatter.string(from: NSNumber(value: result))
            updateLabelText(result)
        } catch {
            label.text = "Ошибка"
        }
        
        calculationHistory.removeAll()
    }
    
    @IBOutlet weak var label: UILabel!
    
    var calculationHistory: [CalculationHistoryItem] = []
    
    // Added number value to show it on screen
    lazy var enteredNumber: Double = 0
    
    lazy var numberFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        
        numberFormatter.usesGroupingSeparator = false
        numberFormatter.locale = Locale(identifier: "ru_RU")
        numberFormatter.numberStyle = .decimal
        
        return numberFormatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resetLabelText()
    }
    
    func calculate() throws -> Double {
        guard case .number(let firstNumber) = calculationHistory[0] else { return 0 }
        
        var currentResult = firstNumber
        
        for index in stride(from: 1, to: calculationHistory.count - 1, by: 2) {
            guard
                case .operation(let operation) = calculationHistory[index],
                case .number(let number) = calculationHistory[index + 1]
            else { break }
            
            currentResult = try operation.calculate(currentResult, number)
        }
        
        return currentResult
    }
    
    func resetLabelText() {
        // Added condition to check if there were any previous number
        if enteredNumber == 0 {
            label.text = "0"
        } else {
            resetPreviousNumber()
            label.text = ""
        }
    }
    
    // Added reset number method to zeroing number value
    func resetPreviousNumber() {
        enteredNumber = 0
    }
    
    // Added update label method to update number on calc screen
    func updateLabelText(_ staticValue: Double) {
        enteredNumber = staticValue
        label.text = numberFormatter.string(from: NSNumber(value: staticValue))
    }
    
}

