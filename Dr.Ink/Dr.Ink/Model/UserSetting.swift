//
//  UserSetting.swift
//  Dr.Ink
//
//  Created by Inwoo Park on 2022/05/16.
//

import Foundation

final class UserSetting: ObservableObject, Codable {
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
    
    init(alarm: Alarm, gender: Gender, weight: Int, activity: Activity, weather: Weather) {
        self.alarm = alarm
        self.gender = gender
        self.weight = weight
        self.activity = activity
        self.weather = weather
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
    
    @Published var alarm: Alarm
    @Published var gender: Gender
    @Published var weight: Int
    @Published var activity: Activity
    @Published var weather: Weather
    
    enum CodingKeys: String, CodingKey {
        case alarm
        case gender
        case weight
        case activity
        case weather
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        alarm = try container.decode(Alarm.self, forKey: .alarm)
        gender = try container.decode(Gender.self, forKey: .gender)
        weight = try container.decode(Int.self, forKey: .weight)
        activity = try container.decode(Activity.self, forKey: .activity)
        weather = try container.decode(Weather.self, forKey: .weather)
    }
    
    func encode(to encoder: Encoder) throws{
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(alarm, forKey: .alarm)
        try container.encode(gender, forKey: .gender)
        try container.encode(weight, forKey: .weight)
        try container.encode(activity, forKey: .activity)
        try container.encode(weather, forKey: .weather)
    }
}

struct Alarm: Codable {
    var repeatTime: Int
    var startTime: Date
    var endTime: Date
}

enum Gender: String, Codable {
    case man
    case woman
}

enum Activity: String, Codable {
    case low
    case middle
    case high
}

enum Weather: String, Codable {
    case hot
    case warm
    case cool
    case cold
}
