//
//  Date+Extension.swift
//  SpaceXApp
//
//  Created by Mohamed Mahmoud on 14/02/2023.
//

import Foundation

extension Date {
    static func getDate(from string: String, format: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        let date = dateFormatter.date(from: string)
        return date ?? Date()
    }
}
