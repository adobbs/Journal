//
//  JournalEntryRowView.swift
//  Journal
//
//  Created by Andy Dobbs on 1/6/24.
//

import SwiftUI

struct JournalEntryRowView: View {
    
    let journalEntry: JournalEntry
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(journalEntry.title)
                    .bold()
                    .lineLimit(1)
//                Spacer()
//                Text(journalEntry.text)
//                    .lineLimit(1)
//                    .foregroundStyle(.secondary)
//                    .frame(width: 120)
            }
            .padding(.bottom, 1)
            HStack {
                Text(journalEntry.date, style: .date)
                    .foregroundStyle(.secondary)
                Text(String(repeating: "⭐️", count: journalEntry.rating))
            }
            .font(.caption)
        }
    }
}

#Preview {
    List {
//        JournalEntryRowView(journalEntry: journalEntries[0])
    }
}
