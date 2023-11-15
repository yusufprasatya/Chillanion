//
//  JournalEntry.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 13/11/23.
//

import Foundation

struct JournalEntry: Codable {
    let date: Date
    let text: String // Change 'let' to 'var' here
    
    init(date: Date, text: String) {
        self.date = date
        self.text = text
    }
}
