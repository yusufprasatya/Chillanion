//
//  JournalView.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 30/10/23.
//

import SwiftUI

class JournalViewCoordinator: NSObject, ObservableObject {
    @Published var selectedJournalID: UUID?
    
    func showDetail(for journalID: UUID) {
        selectedJournalID = journalID
    }
}

struct JournalView: View {
    @State private var isAddingEntry = false
    @State private var isAddJournalViewPresented = false
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\Journal.create_date, order: .reverse)])
    private var journalEntries: FetchedResults<Journal>
    
    @ObservedObject private var coordinator = JournalViewCoordinator()
    
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
                                JournalComponent(
                                    date: DateUtil.formatDatedmmmyyyy(date: entry.create_date!),
                                    text: entry.text ?? ""
                                ) {
                                    coordinator.showDetail(for: entry.id!)
                                }
                            }
                        }
                        .padding(.horizontal, 25)
                    }
                    .padding(.bottom, 140)
                }
            }
            
            
            .background(
                NavigationLink(
                    destination: DetailJournalView(
                        journalText: journalEntries
                                        .first(where: { $0.id == coordinator.selectedJournalID })?
                                        .text ?? ""
                    ),
                    isActive: Binding(
                                               get: { coordinator.selectedJournalID != nil },
                                               set: { _ in coordinator.selectedJournalID = nil }
                                           )
                                       ) {
                                           EmptyView()
                                       }
            )
            
        }.toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink(destination: AddJournalView()) {
                    Image("addButton")
                }
            }
        }
    }
}
extension Optional {
    var isNotNil: Bool {
        self != nil
    }
}
#Preview {
    JournalView()
}
