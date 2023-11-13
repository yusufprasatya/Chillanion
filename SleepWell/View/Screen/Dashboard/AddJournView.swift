//
//  AddJournView.swift
//  SleepWell
//
//  Created by Billbert Pohandy on 12/11/23.
import SwiftUI

struct AddJournalView: View {
    @Binding var journalEntries: [JournalEntry]
    @State private var journalText: String
    @Environment(\.presentationMode) var presentationMode
    
    // Add an initializer to set the initialText
    init(journalEntries: Binding<[JournalEntry]>, initialText: String? = nil) {
        self._journalEntries = journalEntries
        self._journalText = State(initialValue: initialText ?? "")
    }

    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                    Image("blankbg")
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .edgesIgnoringSafeArea(.all)

                    Image("JournalSheet")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 342, height: 687)
                        .clipped()

                    TextEditor(text: $journalText)
                        .scrollContentBackground(.hidden)
                        .offset(y: -15)
                        .foregroundColor(Color.black)
                        .font(.system(size: 20))
                        .lineSpacing(10.7)
                        .background(Color.clear)
                        .frame(width: 302, height: 627)
                        .scrollDisabled(true)
                        .lineLimit(18)
                        .fixedSize(horizontal: false, vertical: true)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        saveEntry()
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Done")
                            .foregroundColor(.circular2)
                    }
                }
            }
        }
    }

    private func saveEntry() {
        // Implement your logic to save or update the journal entry
        if !journalText.isEmpty {
            let currentDate = Date()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd MMM yyyy"
            let date = dateFormatter.string(from: currentDate)

            let entry = JournalEntry(date: date, text: journalText)
            journalEntries.append(entry)
        }
    }
}

#Preview {
    JournalView()
}
