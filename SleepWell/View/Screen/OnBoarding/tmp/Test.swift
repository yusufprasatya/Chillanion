//
//  Test.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 14/11/23.
//

import SwiftUI
import CoreData

struct Test: View {
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: .reverse)])
    private var habitsEntries: FetchedResults<DailyHabits>
    let dataItem = "Hello, World!"
    var body: some View {
        List {
            ForEach(habitsEntries) { habit in
                // Your view for each iteration
                Text(habit.name ?? "")
                    .font(.title)
            }
        }
    }
}


#Preview {
    Test()
}
