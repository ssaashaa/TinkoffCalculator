//
//  DateExtension.swift
//  TinkoffCalculator
//
//  Created by Sasha Stryapkov on 21.02.2024.
//

import Foundation

extension Date {
    func getCurrentDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm"
        
        return dateFormatter.string(from: date)
    }
}
