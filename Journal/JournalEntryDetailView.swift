//
//  JournalEntryDetailView.swift
//  Journal
//
//  Created by Andy Dobbs on 1/5/24.
//

import SwiftUI

struct JournalEntryDetailView: View {
    
    let journalEntry: JournalEntry
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    Text(journalEntry.date, style: .date)
                        .bold()
                    Text("－")
                    Text(String(repeating: "⭐️", count: Int(journalEntry.rating)))
                    Spacer()
                }
                .padding(.bottom)
                Text(journalEntry.text)
            }
            .padding()
        }
        .navigationTitle(journalEntry.title)
    }
}

#Preview {
    NavigationStack {
//        JournalEntryDetailView(journalEntry: journalEntries[0])
    }
}
