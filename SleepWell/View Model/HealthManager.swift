//
//  HealthManager.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 27/10/23.
//

import SwiftUI
import HealthKit

class HealthManager: ObservableObject {
    let healthStore: HKHealthStore?
    var healthKitStatus: String = ""
    
    init() {
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
        
        healthStore?.requestAuthorization(toShare: [], read: [sleepType, stepType]) { (success, error) in
            if success {
                print(success.description)
                print("success")
            } else {
                // Handle authorization failure
                let authStatus = self.healthStore?.authorizationStatus(for: HKObjectType.categoryType(forIdentifier: .sleepAnalysis)!)
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
        let authStatus = healthStore?.authorizationStatus(for: sleepType)
        print(authStatus?.rawValue)
        switch authStatus {
        case .sharingAuthorized:
            healthKitStatus = "sharingAuthorized"
        case .notDetermined:
            healthKitStatus = "notDetermined"
        case .sharingDenied:
            healthKitStatus = "sharingDenied"
        @unknown default:
            healthKitStatus = ""
        }
    }
}
