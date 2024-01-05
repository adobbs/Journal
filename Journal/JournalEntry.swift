//
//  JournalEntry.swift
//  Journal
//
//  Created by Andy Dobbs on 1/5/24.
//

import Foundation

class JournalEntry: Identifiable {
    var title: String = ""
    
    init(title: String) {
        self.title = title
    }
}
