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
    
    // Add an initializer to set the initialText
//    init(journalEntries: Binding<[JournalEntry]>, initialText: String? = nil) {
//        self._journalEntries = journalEntries
//        self._journalText = State(initialValue: initialText ?? "")
//    }
    
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
                .navigationTitle("My Journal")
                .navigationBarTitleDisplayMode(.inline)
                .foregroundColor(.white)
                .offset(y: -70)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                           
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
}

#Preview {
    DetailJournalView(journalText: "")
}
