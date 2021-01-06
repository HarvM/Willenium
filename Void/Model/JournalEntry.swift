//
//  JournalEntry.swift
//  Void
//
//  Created by Marc Harvey on 03/01/2021.
//

import UIKit

//Model that will be used to pass data back and forth between the app and Firebase
struct JournalEntry {
    var entry: String
    var entryDate: Date
    var title: String
    var userId: String
    
    ///Using Firebase and then parsing using the dictionary below for ease of use
    ///So will only have to parse the dictionary rather than each individual item
    var dictionary: [String: Any] {
        return [
            "entry": entry,
            "entryDate": entryDate,
            "title": title,
        ]
    }
}

extension JournalEntry {
    init?(dictionary: [String: Any]) {
        guard let entry = dictionary["entry"] as? String,
              let entryDate = dictionary["entryDate"] as? Date,
              let title = dictionary["title"] as? String,
              let userId = dictionary["userId"] as? String
        else {
            return nil
        }
        self.init(entry: entry, entryDate: entryDate, title: title, userId: userId)
    }
}

