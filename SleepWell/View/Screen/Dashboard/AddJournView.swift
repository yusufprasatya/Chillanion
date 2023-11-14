//
//  AddJournView.swift
//  SleepWell
//
//  Created by Billbert Pohandy on 12/11/23.
import SwiftUI

struct AddJournalView: View {
    @Binding var journalEntries: [JournalEntry]
    @State private var journalText: String

    init(journalEntries: Binding<[JournalEntry]>, initialText: String? = nil) {
        self._journalEntries = journalEntries
        self._journalText = State(initialValue: initialText ?? "")
    }

    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            VStack {
                JournalEditorView(text: $journalText)
                    .navigationBarItems(
                        trailing:
                            Button(action: {
                                saveEntry()
                                presentationMode.wrappedValue.dismiss()
                            }) {
                                Text("Done")
                                    .foregroundColor(Color.circular2) // Replace with your desired color
                            }
                    )
            }
        }
    }

    private func saveEntry() {
        if !journalText.isEmpty {
            let currentDate = Date()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd MMM yyyy"
            let date = dateFormatter.string(from: currentDate)

            let entry = JournalEntry(date: date, text: journalText)

            if let index = journalEntries.firstIndex(where: { $0.id == entry.id }) {
                // Update the existing entry
                journalEntries[index].text = entry.text
            } else {
                // Append the new entry if it doesn't exist
                journalEntries.append(entry)
            }

            // Close the AddJournalView
            presentationMode.wrappedValue.dismiss()
        }
            }
    }

struct JournalEditorView: View {
    @Binding var text: String

    var body: some View {
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

            TextEditor(text: $text)
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
}

#Preview {
    JournalView()
}
