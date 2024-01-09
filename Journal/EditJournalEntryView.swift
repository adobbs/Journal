//
//  EditJournalEntryView.swift
//  Journal
//
//  Created by Andy Dobbs on 1/9/24.
//

import SwiftUI

struct EditJournalEntryView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State var journalEntry: JournalEntry
    @State var isEditMode = false
    
    var body: some View {
        if isEditMode {
            Form {
                TextField("Title", text: $journalEntry.title)
                DatePicker("Date", selection: $journalEntry.date, displayedComponents: .date)
                Text(String(repeating: "⭐️", count: Int(journalEntry.rating)))
                Slider(value: $journalEntry.rating, in: 1...5, step: 1)
                TextEditor(text: $journalEntry.text)
            }
            .navigationTitle("Edit Mode")
            .toolbar {
                Button("Delete") {
                    modelContext.delete(journalEntry)
                    dismiss()
                }
                .foregroundStyle(.red)
                Button("Done") {
                    isEditMode = false
                }
                .bold()
            }
        } else {
            JournalEntryDetailView(journalEntry: journalEntry)
                .toolbar {
                    Button("Edit") {
                        isEditMode = true
                    }
                }
        }
    }
}

#Preview {
    NavigationStack {
        EditJournalEntryView(
            journalEntry: JournalEntry(title: "New Year's Eve", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sed libero enim sed faucibus. Pharetra massa massa ultricies mi quis hendrerit dolor magna. Enim nunc faucibus a pellentesque. Mauris cursus mattis molestie a. Bibendum est ultricies integer quis auctor elit sed vulputate mi. Et malesuada fames ac turpis egestas sed tempus urna. Suspendisse faucibus interdum posuere lorem ipsum dolor sit amet. Amet mauris commodo quis imperdiet massa. Ullamcorper morbi tincidunt ornare massa eget. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sed libero enim sed faucibus. Pharetra massa massa ultricies mi quis hendrerit dolor magna. Enim nunc faucibus a pellentesque. Mauris cursus mattis molestie a. Bibendum est ultricies integer quis auctor elit sed vulputate mi. Et malesuada fames ac turpis egestas sed tempus urna. Suspendisse faucibus interdum posuere lorem ipsum dolor sit amet. Amet mauris commodo quis imperdiet massa. Ullamcorper morbi tincidunt ornare massa eget. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sed libero enim sed faucibus. Pharetra massa massa ultricies mi quis hendrerit dolor magna. Enim nunc faucibus a pellentesque. Mauris cursus mattis molestie a. Bibendum est ultricies integer quis auctor elit sed vulputate mi. Et malesuada fames ac turpis egestas sed tempus urna. Suspendisse faucibus interdum posuere lorem ipsum dolor sit amet. Amet mauris commodo quis imperdiet massa. Ullamcorper morbi tincidunt ornare massa eget.", rating: 4, date: Date())
        )
    }
}
