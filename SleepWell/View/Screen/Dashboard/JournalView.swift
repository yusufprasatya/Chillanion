//
//  JournalView.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 30/10/23.
//

import SwiftUI

struct JournalView: View {
    @State private var isAddJournalViewPresented = false
    @State private var journalEntries: [JournalEntry] = []
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("ReminderBackground")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                VStack(alignment: .leading) {
                    Text("💭 Your brain dump lately....")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .font(.system(size: 22))
                        .padding(.top, 116)
                        .padding(.horizontal, 28.5)
                        .frame(alignment: .topLeading)
                    
                    ScrollView {
                                           VStack(alignment: .leading, spacing: 20) {
                                               ForEach(journalEntries.indices, id: \.self) { index in
                                                   JournalComponent(date: journalEntries[index].date,
                                                                    text: journalEntries[index].text,
                                                                    onEditTapped: {
                                                                        openAddJournalView(with: journalEntries[index])
                                                                    },
                                                                    journalEntries: $journalEntries)
                                               }
                                               .padding(.horizontal, 25)
                        }
                        .padding(.bottom, 140)
                    }
                }
            }
            .navigationBarItems(trailing:
                                    Button(action: {
                openAddJournalView(with: nil)
            }) {
                Image("addButton") // Replace with your actual image asset
                    .resizable()
                    .frame(width: 24, height: 24)
                    .padding()
            }
            )
            .fullScreenCover(isPresented: $isAddJournalViewPresented) {
                AddJournalView(journalEntries: $journalEntries)
            }
        }
    }
    
    private func openAddJournalView(with entry: JournalEntry?) {
        let initialText = entry?.text ?? ""
        isAddJournalViewPresented = true
    }
}
#Preview {
    JournalView()
}
