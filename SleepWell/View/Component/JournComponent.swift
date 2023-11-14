//
//  JournComponent.swift
//  SleepWell
//
//  Created by Billbert Pohandy on 12/11/23.
//

import SwiftUI
struct JournalComponent: View {
    let date: String
    let text: String
    var onEditTapped: (() -> Void)? = nil
    @Binding var journalEntries: [JournalEntry]

    var body: some View {
        NavigationLink(
            destination: AddJournalView(journalEntries: $journalEntries, initialText: text),
            label: {
                VStack(alignment: .leading) {
                    HStack {
                        Circle()
                            .fill(Color.circular3) // Replace with your desired color
                            .frame(width: 23, height: 23)

                        Text(date)
                            .fontWeight(.bold)
                            .foregroundColor(.circular3) // Replace with your desired color
                            .font(.system(size: 22))
                    }
                    .padding(.leading, -10)

                    HStack {
                        Rectangle()
                            .fill(Color.circular3) // Replace with your desired color
                            .frame(width: 2, height: 80)

                        ZStack {
                            Rectangle()
                                .fill(Color.circular2) // Replace with your desired color
                                .frame(width: 300, height: 80)
                                .cornerRadius(10)

                            Text(text)
                                .fontWeight(.semibold)
                                .font(.system(size: 12))
                                .padding(.top, 7.5)
                                .frame(width: 290, height: 74, alignment: .topLeading)
                        }
                    }
                }
                .padding(.horizontal)
            }
        )
               .onTapGesture {
                   // Call the onEditTapped closure when the link is tapped
                   onEditTapped?()
               }
           }
       }
struct JournalEntry: Identifiable, Hashable {
    let id = UUID()
    let date: String
    var text: String // Change 'let' to 'var' here
}
