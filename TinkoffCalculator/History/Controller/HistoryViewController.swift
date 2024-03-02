//
//  HistoryViewController.swift
//  TinkoffCalculator
//
//  Created by Sasha Stryapkov on 29.01.2024.
//

import UIKit

class HistoryViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    
    var calculations: [Calculation] = []
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialize()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let nib = UINib(nibName: "HistoryTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "HistoryTableViewCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationItem.title = "Прошлые вычисления"
    }
    
    private func initialize() {
        modalPresentationStyle = .fullScreen
    }
    
    private func expressionToString(_ expression: [CalculationHistoryItem]) -> String {
        var result = ""
        
        for operand in expression {
            switch operand {
            case let .number(value):
                result += String(value) + " "
            case let .operation(value):
                result += value.rawValue + " "
            }
        }
        
        return result
    }
    
    private func getCurrentDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm"
        
        return dateFormatter.string(from: date)
    }
}

extension HistoryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionHeader = UIView(frame: CGRect(x: 0,
                                                 y: 0,
                                                 width: tableView.frame.width,
                                                 height: 40))
        let sectionText = UILabel()
        sectionText.frame = CGRect(x: 20,
                                   y: 0,
                                   width: sectionHeader.frame.width - 10,
                                   height: sectionHeader.frame.height - 10)
        
        sectionText.text = getCurrentDate(calculations[section].date)
        sectionText.textColor = .white
        sectionText.font = .systemFont(ofSize: 14, weight: .bold)
        
        sectionText.accessibilityIdentifier = "sectionHeader_\(section)"
        sectionHeader.addSubview(sectionText)
        
        return sectionHeader
    }
}

extension HistoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        calculations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryTableViewCell",
                                                 for: indexPath) as! HistoryTableViewCell
        let historyItem = calculations[indexPath.section]
        cell.configure(with: expressionToString(historyItem.expression), result: String(historyItem.result))
        cell.accessibilityIdentifier = "historyCell_\(indexPath.section)"
        return cell
    }
}
