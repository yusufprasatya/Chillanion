//
//  SleeManager.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 27/10/23.
//

import SwiftUI
import HealthKit

class SleepManager: ObservableObject {
    let healthStore: HKHealthStore?
    @Published var sleepData: [SleepEntry] = []
    
    init() {
        self.healthStore = HKHealthStore()
    }
    
    func readSleep(from startDate: Date?, to endDate: Date?) {
        guard let sleepType = HKObjectType.categoryType(forIdentifier: .sleepAnalysis) else {
            return
        }
        
        // we create a predi,cate to filter our data
        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: endDate, options: [])
        
        // I had a sortDescriptor to get the recent data first
        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierEndDate, ascending: true)
        
        // get user device name
        
        // we create our query with a block completion to execute
        let query = HKSampleQuery(sampleType: sleepType, predicate: predicate, limit: 0, sortDescriptors: [sortDescriptor]) {   [weak self] query, results, error in
            if error != nil {
                // handle error
                return
            }
            
            if let samples = results as? [HKCategorySample] {
                // Filter and process the retrieved sleep analysis data
                let filteredSamples = samples
                    .compactMap { (sample: HKCategorySample) -> HKCategorySample? in
                        if sample.sourceRevision.source.bundleIdentifier.contains("com.apple.health")
                        {
                            return sample
                        }
                        return nil
                    }
                print("data \(filteredSamples.count)")
                self?.getDurationOfSleep(filteredSamples)
            }
        }
        // execute our query
        healthStore?.execute(query)
    }
    
    func getDurationOfSleep(_ samples: [HKCategorySample]) {
        var sleepData: [SleepEntry] = []
        
        print("samples \(samples.count)")
        for sample in samples {
            let startDate = sample.startDate
            let endDate = sample.endDate
            let sleepStages: String
            
            switch sample.value {
            case HKCategoryValueSleepAnalysis.inBed.rawValue:
                sleepStages = "In Bed"
            case HKCategoryValueSleepAnalysis.awake.rawValue:
                sleepStages = "Awake"
            case HKCategoryValueSleepAnalysis.asleepREM.rawValue:
                sleepStages = "REM"
            case HKCategoryValueSleepAnalysis.asleepDeep.rawValue:
                sleepStages = "Deep"
            case HKCategoryValueSleepAnalysis.asleepCore.rawValue:
                sleepStages = "Core"
            default:
                sleepStages = "Unspecified"
            }
            
            // Calculate the duration of the sleep sample
            let duration = endDate.timeIntervalSince(startDate)
            
            // Create a SleepEntry object and add it to the sleepData array
            if sleepStages != "Unspecified"{
                let sleepEntry = SleepEntry(id: sample.uuid, startDate: startDate, endDate: endDate, sleepStages: sleepStages, duration: duration, source: sample.source.name)
                print("Sleep Entry duration \(sleepEntry.duration) source \(sleepEntry.source) stages \(sleepEntry.sleepStages)")
                sleepData.append(sleepEntry)
            }
        }
        
        DispatchQueue.main.async {
            // Update your SwiftUI view with the processed sleep data on the main thread
            self.sleepData = sleepData
        }
    }
}
