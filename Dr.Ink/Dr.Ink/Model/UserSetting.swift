//
//  UserSetting.swift
//  Dr.Ink
//
//  Created by Inwoo Park on 2022/05/16.
//

import Foundation

struct UserSetting: Codable {
    static var shared = UserSetting(alarm: Alarm(repeatTime: 30, startTime: .now, endTime: .now), gender: .man, weight: 70, activity: .middle, weather: .warm)
    static let key = "UserSetting"
    
    static func storeInUserDefaults() {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(UserSetting.shared)
            UserDefaults.standard.set(data, forKey: UserSetting.key)
        } catch {
            print(error)
        }
    }
    
    static func fetchFromUserDefaults() {
        guard let data = UserDefaults.standard.data(forKey: UserSetting.key) else { return }
        let decoder = JSONDecoder()
        do {
            let userSettring = try decoder.decode(UserSetting.self, from: data)
            UserSetting.shared = userSettring
        } catch {
            print(error)
        }
    }
    
    var alarm: Alarm
    var gender: Gender
    var weight: Int
    var activity: Activity
    var weather: Weather
}

struct Alarm: Codable {
    var repeatTime: Int
    var startTime: Date
    var endTime: Date
}

enum Gender: Codable {
    case man
    case woman
}

enum Activity: Codable {
    case low
    case middle
    case high
}

enum Weather: Codable {
    case hot
    case warm
    case cool
    case cold
}
