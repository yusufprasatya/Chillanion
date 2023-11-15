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

    var body: some View {
        ScrollViewReader{ proxy in
            ScrollView{
                List {
                    ForEach(habitsEntries) { dailyHabit in
                        CustomViewButton(
                            icon: dailyHabit.icon ?? "",
                            title: dailyHabit.name ?? "",
                            desc: dailyHabit.desc ?? "",
                            isSelected: false
                        ) {
                            // Your action goes here
                        }
                    }
                }

            }
            
        }
    }
}


#Preview {
    Test()
}
