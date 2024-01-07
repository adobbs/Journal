//
//  ContentView.swift
//  Journal
//
//  Created by Andy Dobbs on 1/5/24.
//

import SwiftUI
import SwiftData

struct JournalEntriesListView: View {
    @Environment(\.modelContext) private var modelContext
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
    
    private func addEntry() {
        withAnimation {
            let newEntry = JournalEntry(
                title: "Took a nap",
                text: "I took a nap on this day",
                rating: 5,
                date: Date()
            )
            modelContext.insert(newEntry)
        }
    }
}

#Preview {
    JournalEntriesListView()
        .modelContainer(for: JournalEntry.self, inMemory: true)
}
