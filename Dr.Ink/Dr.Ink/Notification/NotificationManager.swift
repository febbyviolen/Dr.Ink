//
//  NotificationManager.swift
//  Dr.Ink
//
//  Created by Inwoo Park on 2022/05/24.
//

import Foundation
import UserNotifications

final class NotificationManager {
    static let shared: NotificationManager = NotificationManager()
    private let content: UNMutableNotificationContent
    private let identifier: String = "noti"
    
    private init() {
        let content = UNMutableNotificationContent()
        content.title = "물 마실 시간!!"
        content.body = "물을 마셔서 건강을 회복해보세요!"
        self.content = content
        requestAuth()
    }
    
    func requestAuth() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { _, error in }
    }
    
    func setAlarm(date: Date) {
        let date = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: date, repeats: true)
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
    
    func removeAlarm() {
        UNUserNotificationCenter.current().removeDeliveredNotifications(withIdentifiers: [identifier])
    }
}
