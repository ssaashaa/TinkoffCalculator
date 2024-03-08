//
//  CalculationViewController.swift
//  TinkoffCalculator
//
//  Created by Sasha Stryapkov on 26.01.2024.
//

import UIKit

class CalculationViewController: UIViewController {
    @IBOutlet private weak var label: UILabel!
    @IBOutlet private weak var historyButton: UIButton!
    
    private let alertView: AlertView = {
        let screenBounds = UIScreen.main.bounds
        let alertHeight: CGFloat = 100
        let alertWidth: CGFloat = screenBounds.width - 40
        let x: CGFloat = screenBounds.width / 2 - alertWidth / 2
        let y: CGFloat = screenBounds.height / 2 - alertHeight / 2
        let alertFrame = CGRect(x: x, y: y, width: alertWidth, height: alertHeight)
        let alertView = AlertView(frame: alertFrame)
        return alertView
    }()
    
    var calculationHistory: [CalculationHistoryItem] = []
    var calculations: [Calculation] = []
    let calculationHistoryStorage = CalculationHistoryStorage()
    
    lazy var enteredNumber: Double = 0
    lazy var lastCalculatedResult: Double = 0
    lazy var numberFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        
        numberFormatter.usesGroupingSeparator = false
        numberFormatter.locale = Locale(identifier: "ru_RU")
        numberFormatter.numberStyle = .decimal
        
        return numberFormatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backButtonTitle = "Назад"
        
        resetLabelText()
        resetLastCalculatedNumber()
        
        calculations = calculationHistoryStorage.loadHistory()
        
        alertView.alpha = 0
        alertView.alertText = "Вы нашли пасхалку!"
        alertView.accessibilityIdentifier = "easterEgg"
        view.addSubview(alertView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationItem.title = "Калькулятор"
    }
    
    @IBAction private func buttonPressed(_ sender: UIButton) {
        guard let buttonText = sender.currentTitle else { return }
        
        if enteredNumber != 0 {
            resetLabelText()
        }
        
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
        
        if label.text == "3,141592" {
            animateAlert()
        }
        
        sender.animateTap()
    }
    
    @IBAction private func operationButtonPressed(_ sender: UIButton) {
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
    
    @IBAction private func clearButtonPressed() {
        calculationHistory.removeAll()
        resetPreviousNumber()
        resetLastCalculatedNumber()
        resetLabelText()
    }
    
    @IBAction private func calculateButtonPressed() {
        guard
            let labelText = label.text,
            let labelNumber = numberFormatter.number(from: labelText)?.doubleValue
        else { return }
        
        calculationHistory.append(.number(labelNumber))
        
        do {
            let result = try calculate()
            let newCalculation = Calculation(expression: calculationHistory, result: result, date: Date())
            calculations.append(newCalculation)
            calculationHistoryStorage.setHistory(calculation: calculations)
            updateLabelText(result)
        } catch {
            label.text = "Ошибка"
            label.shake()
        }
        
        calculationHistory.removeAll()
    }
    
    @IBAction private func showCalculationsList(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let calculationsListVC = sb.instantiateViewController(withIdentifier: "CalculationsListViewController")
        if let vc = calculationsListVC as? HistoryViewController {
            vc.calculations = calculations
        }
        navigationController?.pushViewController(calculationsListVC, animated: true)
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
        
        lastCalculatedResult = currentResult
        
        return currentResult
    }
    
    func resetLabelText() {
        if enteredNumber == 0 {
            label.text = "0"
        } else {
            resetPreviousNumber()
            label.text = ""
        }
    }
    
    func resetPreviousNumber() {
        enteredNumber = 0
    }
    
    func resetLastCalculatedNumber() {
        lastCalculatedResult = 0
    }
    
    func updateLabelText(_ enteredNumber: Double) {
        self.enteredNumber = enteredNumber
        label.text = numberFormatter.string(from: NSNumber(value: enteredNumber))
    }
    
    func animateAlert() {
        if !view.contains(alertView) {
            alertView.alpha = 0
            alertView.center = view.center
            view.addSubview(alertView)
        }
        
        UIView.animateKeyframes(withDuration: 2.0, delay: 0.5) {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5) {
                self.alertView.alpha = 1
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5) {
                var newCenter = self.label.center
                newCenter.y -= self.alertView.bounds.height
                self.alertView.center = newCenter
            }
        }
    }
}
