//
//  DetailJournal.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 15/11/23.
//

import SwiftUI

struct DetailJournalView: View {
  @State var journalText: String
  @State private var date: Date = Date()
  @Environment(\.presentationMode) var presentationMode
  
  var body: some View {
      GeometryReader{_ in
          ZStack {
              Image("blankbg")
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
              
              VStack {
                ZStack {
                    Image("JournalSheet")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 342, height: 687)
                        .clipped()
                    Text("\(DateUtil.formatDate(date: date))")
                        .font(.system(size: 20))
                        .foregroundColor(Color.black)
                        .background(Color.clear)
                        .offset(x: -80, y: -305)
                    TextEditor(text: $journalText)
                        .scrollContentBackground(.hidden)
                        .offset(y: 17)
                        .foregroundColor(Color.journaltext)
                        .font(Font.custom("Alegreya Sans", size: 25))
                        .lineSpacing(10.7)
                        .background(Color.clear)
                        .frame(width: 302, height: 627)
                        .scrollDisabled(true)
                        .lineLimit(18)
                        .fixedSize(horizontal: false, vertical: true)
                }
              }
              .navigationTitle("My Journal")
              .navigationBarTitleDisplayMode(.inline)
              .foregroundColor(.white)
              .offset(y: -70)
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
      }.ignoresSafeArea(.keyboard, edges: .bottom)
  }
  
  private func saveEntry() {
      // Implement your logic to save or update the journal entry
      if !journalText.isEmpty {
          let entry = JournalEntry(date: date, text: journalText)
          PersistenceController.shared.saveJournal(journal: entry)
      }
  }
}

#Preview {
    DetailJournalView(journalText: "")
}
