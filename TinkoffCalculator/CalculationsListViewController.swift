//
//  CalculationsListViewController.swift
//  TinkoffCalculator
//
//  Created by Sasha Stryapkov on 29.01.2024.
//

import UIKit

class CalculationsListViewController: UIViewController {
    @IBOutlet private weak var calculationLabel: UILabel!
    
    var result: String?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialize()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        navigationItem.title = "Прошлые вычисления"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calculationLabel.text = result
    }
    
    private func initialize() {
        modalPresentationStyle = .fullScreen
    }
}
