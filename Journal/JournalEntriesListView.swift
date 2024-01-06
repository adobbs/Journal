//
//  ContentView.swift
//  Journal
//
//  Created by Andy Dobbs on 1/5/24.
//

import SwiftUI

struct JournalEntriesListView: View {
    var body: some View {
        NavigationStack {
            List(journalEntries) { journalEntry in
                NavigationLink(destination: JournalEntryDetailView(journalEntry: journalEntry)) {
                    JournalEntryRowView(journalEntry: journalEntry)
                }
            }
            .navigationTitle("\(journalEntries.count) Journal Entries")
        }
    }
}

#Preview {
    JournalEntriesListView()
}
