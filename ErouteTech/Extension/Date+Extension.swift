//
//  Date+Extension.swift
//  ErouteTech
//
//  Created by jatin verma on 04/05/21.
//

import Foundation

extension Date {
    var formattedTime: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm a"
        return dateFormatter.string(from: self)
    }
}
