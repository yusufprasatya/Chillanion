//
//  Test.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 14/11/23.
//

import SwiftUI
import CoreData

struct TesCustom: View {
    
    @State private var scaleFactor: CGFloat = 1
    @State private var showAlert = false
    @State private var isImage1 = false
    @EnvironmentObject var sleepManager: SleepManager
    
    var sleepFilter = SleepFilter()
    @State var sleepEntry: [SleepEntry] = []
    
    var body: some View{
        VStack{
            Text("\(sleepEntry.count))")
        }
        .onAppear{
            sleepEntry = sleepFilter.filteringSleepDailyBySource(sleepData: sleepManager.sleepData)
        }
    }
}


#Preview {
    TesCustom()
}
