//
//  UserNotificationService.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 27/10/23.
//

import Foundation
import UserNotifications

class UserNotificationService {
    static let shared = UserNotificationService()
    
    func requestPermission() {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            if granted {
                print("Notification Granted")
            }else if let error = error{
                print(error.localizedDescription)
            }
        }
    }
    
    func scheduleNotification(identifier: String, type: String, timeInterval: TimeInterval?, title: String, body: String, notifHour: DateComponents?) {
        var trigger: UNNotificationTrigger?
        
        if type == "date" {
            trigger = UNCalendarNotificationTrigger(dateMatching: notifHour!, repeats: true)
        } else if type == "time"{
            trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeInterval!, repeats: true)
        }
        
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = UNNotificationSound.default
        
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
    
    func disableNotifications(identifiers: [String]) {
        UNUserNotificationCenter.current().getNotificationSettings { settings in
            if settings.authorizationStatus == .authorized {
                UNUserNotificationCenter.current().removeDeliveredNotifications(withIdentifiers: identifiers)
                UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: identifiers)
                print("Notifications disabled")
            } else {
                print("Notifications are not authorized")
            }
        }
    }
}
