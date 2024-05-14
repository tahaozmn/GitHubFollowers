//
//  Date+Ext.swift
//  GitHubFollowers
//
//  Created by Taha Özmen on 14.05.2024.
//

import UIKit

extension Date {
    
    func convertToMonthYearFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM yyyy"
        return dateFormatter.string(from: self)
    }
}
