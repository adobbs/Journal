//
//  CreateJournalEntryView.swift
//  Journal
//
//  Created by Andy Dobbs on 1/7/24.
//

import SwiftUI

struct CreateJournalEntryView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State var title: String = ""
    @State var text: String = "Today, I..."
    @State var rating: Double = 3.0
    @State var date: Date = Date()
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Title", text: $title)
                DatePicker("Date", selection: $date, displayedComponents: .date)
                Text(String(repeating: "⭐️", count: Int(rating)))
                Slider(value: $rating, in: 1...5, step: 1)
                TextEditor(text: $text)
            }
            .navigationTitle("New Journal Entry")
            .toolbar {
                ToolbarItem(placement: .navigation) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem {
                    Button("Save") {
                        addEntry()
                        dismiss()
                    }
                }
            }
        }
    }
    
    private func addEntry() {
        withAnimation {
            let newEntry = JournalEntry(
                title: title,
                text: text,
                rating: rating,
                date: date
            )
            modelContext.insert(newEntry)
        }
    }
}

#Preview {
    CreateJournalEntryView()
}
