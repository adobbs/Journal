//
//  ContentView.swift
//  Journal
//
//  Created by Andy Dobbs on 1/5/24.
//

import SwiftUI

struct JournalEntriesListView: View {
    
    let journalEntries: [JournalEntry] = [
        JournalEntry(title: "New Year's Eve"),
        JournalEntry(title: "Ate a Burger"),
        JournalEntry(title: "Slept like an asthmatic"),
        JournalEntry(title: "Played Teamfight Tactics"),
    ]
    
    var body: some View {
        NavigationStack {
            List(journalEntries) { journalEntry in
                NavigationLink(destination: Text(journalEntry.title)) {
                    Text(journalEntry.title)
                }
            }
            .navigationTitle("\(journalEntries.count) Journal Entries")
        }
    }
}

#Preview {
    JournalEntriesListView()
}
