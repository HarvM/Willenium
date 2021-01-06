//
//  Date.swift
//  Void
//
//  Created by Marc Harvey on 03/01/2021.
//

import UIKit

///Will format the date of the entry to a string to allow it to be displayed in the cell on the main JournalView
extension Date {
    func toString(dateFormat format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
