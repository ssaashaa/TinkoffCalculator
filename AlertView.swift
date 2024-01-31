//
//  AlertView.swift
//  TinkoffCalculator
//
//  Created by Sasha Stryapkov on 31.01.2024.
//

import UIKit

class AlertView: UIView {
    private let label: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    
    var alertText: String? {
        didSet {
            label.text = alertText
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
    }
    
    private func setupUI() {
        let tap = UITapGestureRecognizer()
        tap.addTarget(self, action: #selector(hide))
        addGestureRecognizer(tap)
        
        backgroundColor = .red
        
        addSubview(label)
    }
    
    @objc private func hide() {
        removeFromSuperview()
    }
}
