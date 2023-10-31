//
//  SleepManager.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 19/10/23.
//

import HealthKit
import Foundation

@MainActor
class SleepManager2: NSObject, ObservableObject {
    let healthStore: HKHealthStore
    private var category: String = ""

    let calendar = Calendar.current
    // fixed sleep manager.
    
    @Published var allSleep: Set<HKCategoryValueSleepAnalysis>?
    @Published var healthKitStatus: String?
    @Published var sleepData: [SleepEntry] = []
    @Published var isSleepDataFetched = false
    @Published var tmpDuration = [Double]()
    @Published var averageDuration = 0.0
    @Published var filter = 0
    @Published var normal = 0
    @Published var sourceName = ""
    @Published var stepCounts: [String: Double] = [:]
    @Published var todaysStepCount: Double = 0
    @Published var error: Error?
    @Published var isSuccessAuthorized = false
    @Published var averageInHour = 0
    @Published var averageInMinutes = 0
    
    override init() {
        self.healthStore = HKHealthStore()
    }
    
    func requestHealthAuthorization() {
        // Check if sleep data is available on the device
        guard HKHealthStore.isHealthDataAvailable() else {
            print("Health data is not available on this device.")
            return
        }
        
        let sleepType = HKObjectType.categoryType(forIdentifier: .sleepAnalysis)!
        let stepType = HKObjectType.quantityType(forIdentifier: .stepCount)!
        
        healthStore.requestAuthorization(toShare: [], read: [sleepType, stepType]) { (success, error) in
            if success {
                print(success.description)
                print("success")
                self.isSuccessAuthorized.toggle()
            } else {
                // Handle authorization failure
                let authStatus = self.healthStore.authorizationStatus(for: HKObjectType.categoryType(forIdentifier: .sleepAnalysis)!)
                if authStatus == .sharingDenied {
                    // Handle the sharing denied case
                    print("Why Denied")
                }
                
                if let error = error {
                    print("Authorization Error: \(error.localizedDescription)")
                }
            }
        }
    }
    
    func getCurrentAuthStatus() {
        let sleepType = HKObjectType.categoryType(forIdentifier: .sleepAnalysis)!
        let authStatus = healthStore.authorizationStatus(for: sleepType)
        print(authStatus.rawValue)
        
        switch authStatus {
        case .sharingAuthorized:
            healthKitStatus = "sharingAuthorized"
        case .notDetermined:
            healthKitStatus = "notDetermined"
        case .sharingDenied:
            healthKitStatus = "sharingDenied"
        @unknown default:
            healthKitStatus = nil
        }
    }
    
    func readSleep(from startDate: Date?, to endDate: Date?) {
        guard let sleepType = HKObjectType.categoryType(forIdentifier: .sleepAnalysis) else {
            return
        }
        
        // we create a predi,cate to filter our data
        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: endDate, options: [])
        
        // I had a sortDescriptor to get the recent data first
        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierEndDate, ascending: true)
        
        // we create our query with a block completion to execute
        let query = HKSampleQuery(sampleType: sleepType, predicate: predicate, limit: 0, sortDescriptors: [sortDescriptor]) { (query, result, error) in
            if error != nil {
                // handle error
                return
            }
            
            if let samples = result as? [HKCategorySample] {
                // Filter and process the retrieved sleep analysis data
                let filteredSamples = samples
                    .compactMap { (sample: HKCategorySample) -> HKCategorySample? in
                        if sample.sourceRevision.source.bundleIdentifier.contains("com.apple.health") &&
                            sample.sourceRevision.source.name.contains("Iphone")
                        {
                            return sample
                        }
                        
                        return nil
                    }
                
                
                print("data \(filteredSamples.count)")
                DispatchQueue.main.async {
                    self.getDurationOfSleep(filteredSamples)
                }
            }
        }
        
        print("Reaaddddddd")
        
        // execute our query
        healthStore.execute(query)
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
                print("Sleep Data \(sample.source.bundleIdentifier)")
                sleepData.append(sleepEntry)
            }
        }
        
        DispatchQueue.main.async {
            // Update your SwiftUI view with the processed sleep data on the main thread
            self.sleepData = sleepData
        }
    }
    
    // create a function that calculate the total duration of sleep
    func getTotalDurationOfSleep() -> TimeInterval {
        var totalDuration: TimeInterval = 0
        
        for sleep in sleepData {
            totalDuration += sleep.duration
            print("total duration \(sleep.duration)")
        }
        
        return totalDuration
    }
    
    // make function to calculate the average duration of sleep
    func getThreeMonthTotalSleepDuration() -> TimeInterval {
        
        //        let oneWeekAgo = Date() - 7 * 24 * 60 * 60
        let now =  Date()
        var totalDuration: TimeInterval = 0
     
        // create variabel that represent 3 months ago
        let threeMonthAgo = Date() - 3 * 30 * 24 * 60 * 60
        
        readSleep(from: threeMonthAgo, to: now)
        
        print("trrii \(threeMonthAgo)")
        print("reatunr sleep \(sleepData.count)")
        print("sleep \(sleepData.count)")
        for sleep in sleepData {
            totalDuration += sleep.duration
        }
        
        print("Total duration of 3 months \(totalDuration)")
        
        return totalDuration
         
    }
    
    func getLastSleep(starTime: Date, endTime: Date) -> TimeInterval {
        var totalDuration: TimeInterval = 0
        
        for sleep in sleepData {
            if sleep.startDate >= starTime && sleep.endDate <= endTime {
                totalDuration += sleep.duration
            }
        }
        
        return totalDuration
    }
    
    // create function that calculate avereage of 3 month sleep duration
    func getAverageSleepDuration() -> TimeInterval{
        let average = getThreeMonthTotalSleepDuration() / 90
        print("ini average \(average)")
//        DispatchQueue.main.async {
//            self.averageDuration = average
//        }
        let (hours, minutes) = extractNumbers(from: humanReadableHour(data: average))
        averageInHour = hours
        averageInMinutes = minutes
        print("averageInHour \(averageInHour)")
        print("averageInMinutes \(averageInMinutes)")
//        print("Ini average \(aver)")
        return average

        
    }
    
    func getNormalSleep() -> Int {
        var normal = 0
        
        for sleep in sleepData {
            if sleep.duration >= 21600 && sleep.duration <= 32400 {
                normal += 1
            }
        }
        return normal
    }
    
    func getSleepData() {
        let sleepType = HKObjectType.categoryType(forIdentifier: .sleepAnalysis)!
        let predicate = HKQuery.predicateForSamples(withStart: Date.distantPast, end: Date(), options: [])
        
        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierEndDate, ascending: false)
        
        let query = HKSampleQuery(sampleType: sleepType, predicate: predicate, limit: 0, sortDescriptors: [sortDescriptor]) { (query, result, error) in
            if error != nil {
                // handle error
                return
            }
            
            if let samples = result as? [HKCategorySample] {
                // Filter and process the retrieved sleep analysis data
                let filteredSamples = samples
                    .compactMap { (sample: HKCategorySample) -> HKCategorySample? in
                        if sample.sourceRevision.source.bundleIdentifier.contains("com.apple.health") {
                            return sample
                        }
                        return nil
                    }
                
                self.getDurationOfSleep(filteredSamples)
            }
        }
        
        healthStore.execute(query)
    }
    
    // Fetch step count data
    func fetchStepCount(completion: @escaping (Double?, Error?) -> Void) {
        let stepType = HKSampleType.quantityType(forIdentifier: .stepCount)!
        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: false)
        
        let query = HKSampleQuery(sampleType: stepType, predicate: nil, limit: 1, sortDescriptors: [sortDescriptor]) { (query, results, error) in
            if let result = results?.first as? HKQuantitySample {
                let steps = result.quantity.doubleValue(for: HKUnit.count())
                completion(steps, nil)
            } else {
                completion(nil, error)
            }
        }
        
        healthStore.execute(query)
    }
    
    func fetchStepCountsPerDay() {
        let calendar = NSCalendar.current
        let interval = NSDateComponents()
        interval.day = 1
        
        var anchorComponents = calendar.dateComponents([.day, .month, .year], from: NSDate() as Date)
        anchorComponents.hour = 0
        let anchorDate = calendar.date(from: anchorComponents)
        
        let stepsCount = HKObjectType.quantityType(forIdentifier: .stepCount)
        
        let stepsQuery = HKStatisticsCollectionQuery(quantityType: stepsCount!,
                                                     quantitySamplePredicate: nil,
                                                     options: .cumulativeSum,
                                                     anchorDate: anchorDate!,
                                                     intervalComponents: interval as DateComponents)
        
        stepsQuery.initialResultsHandler = {query, results, error in
            let endDate = NSDate()
            let startDate = calendar.date(byAdding: .day, value: -7, to: endDate as Date, wrappingComponents: false)
            if let myResults = results{
                myResults.enumerateStatistics(from: startDate!, to: endDate as Date) { statistics, stop in
                    if let quantity = statistics.sumQuantity(){
                        let date = statistics.startDate
                        let steps = quantity.doubleValue(for: HKUnit.count())
                        print("\(date): steps = \(steps)")
                        DispatchQueue.main.async {
                            //update UI components
                            
                        }
                    }
                }
            }
        }
        healthStore.execute(stepsQuery)
    }
    
    func getTodaysSteps(completion: @escaping (Double) -> Void) {
        let stepsQuantityType = HKQuantityType.quantityType(forIdentifier: .stepCount)!
        
        let now = Date()
        let startOfDay = Calendar.current.startOfDay(for: now)
        let predicate = HKQuery.predicateForSamples(
            withStart: startOfDay,
            end: now,
            options: .strictStartDate
        )
        
        let query = HKStatisticsQuery(
            quantityType: stepsQuantityType,
            quantitySamplePredicate: predicate,
            options: .cumulativeSum
        ) { _, result, _ in
            guard let result = result, let sum = result.sumQuantity() else {
                completion(0.0)
                return
            }
            print(sum.doubleValue(for: HKUnit.count()))
            
            DispatchQueue.main.async {
                self.todaysStepCount = sum.doubleValue(for: HKUnit.count())
                completion(sum.doubleValue(for: HKUnit.count()))
            }
        }
        healthStore.execute(query)
    }
    
    func formatDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        return dateFormatter.string(from: date)
    }
    
    func humanReadableHour (data: TimeInterval) -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute]
        formatter.unitsStyle = .abbreviated
        return formatter.string(from: data)!
    }
    
    func extractNumbers(from input: String) -> (hours: Int, minutes: Int) {
        do {
            let regex = try NSRegularExpression(pattern: "(\\d+)h (\\d+)m", options: [])
            if let match = regex.firstMatch(in: input, options: [], range: NSRange(input.startIndex..., in: input)) {
                let hoursRange = Range(match.range(at: 1), in: input)
                let minutesRange = Range(match.range(at: 2), in: input)
                
                if let hoursRange = hoursRange, let minutesRange = minutesRange {
                    if let hours = Int(input[hoursRange]), let minutes = Int(input[minutesRange]) {
                        return (hours, minutes)
                    }
                }
            }
        } catch {
            print("Error: \(error)")
        }
        
        return (0, 0)
    }
    
}
