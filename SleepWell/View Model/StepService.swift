//
//  StepService.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 27/10/23.
//

import Foundation
import HealthKit

class StepService: ObservableObject {
    let healthStore: HKHealthStore?
    
    init() {
        self.healthStore = HKHealthStore()
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
            
            // Return the result via the completion handler
            completion(sum.doubleValue(for: HKUnit.count()))
            
        }
        healthStore?.execute(query)
    }
}
