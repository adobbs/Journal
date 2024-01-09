//
//  ContentView.swift
//  Journal
//
//  Created by Andy Dobbs on 1/5/24.
//

import SwiftUI
import SwiftData

struct JournalEntriesListView: View {
    @Query private var journalEntries: [JournalEntry]
    
    @State var showCreateView = false
    
    var body: some View {
        NavigationStack {
            List(journalEntries) { journalEntry in
                NavigationLink(destination: JournalEntryDetailView(journalEntry: journalEntry)) {
                    JournalEntryRowView(journalEntry: journalEntry)
                }
            }
            .navigationTitle("\(journalEntries.count) Journal Entries")
            .toolbar {
                Button(action: {
                    showCreateView = true
                }) {
                    Label("Add Entry", systemImage: "plus")
                }
            }
            .sheet(isPresented: $showCreateView) {
                CreateJournalEntryView()
            }
        }
    }
}

#Preview {
    JournalEntriesListView()
        .modelContainer(for: JournalEntry.self, inMemory: true)
}
