//
//  JournalView.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 30/10/23.
//

import SwiftUI

struct JournalView: View {
    @State private var isAddingEntry = false
    @State private var isAddJournalViewPresented = false
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\Journal.create_date, order: .reverse)])
    private var journalEntries: FetchedResults<Journal>
    
    var body: some View {
        NavigationStack {
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
                            ForEach(journalEntries, id: \.id) { entry in
                                NavigationLink(destination: {
                                    DetailJournalView(journalText: entry.text ?? "")
                                }, label: {
                                    JournalComponent(date: DateUtil.formatDatedmmmyyyy(date: entry.create_date!), text: entry.text ?? "")
                                })
                            }
                        }
                        .padding(.horizontal, 25)
                    }
                    .padding(.bottom, 140)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: AddJournalView(), isActive: $isAddJournalViewPresented) {
                        Button(action: {
                            isAddJournalViewPresented = true
                        }) {
                            Image("addButton")
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    JournalView()
}
