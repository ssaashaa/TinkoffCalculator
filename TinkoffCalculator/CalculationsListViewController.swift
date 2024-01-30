//
//  CalculationsListViewController.swift
//  TinkoffCalculator
//
//  Created by Sasha Stryapkov on 29.01.2024.
//

import UIKit

class CalculationsListViewController: UIViewController {
    
    var result: String?
    @IBOutlet weak var calculationLabel: UILabel!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialize()
    }
    
    private func initialize() {
        modalPresentationStyle = .fullScreen
        navigationItem.title = "Прошлые вычисления"
    }
    
    override func viewDidLoad() {
        calculationLabel.text = result
    }
    
}
