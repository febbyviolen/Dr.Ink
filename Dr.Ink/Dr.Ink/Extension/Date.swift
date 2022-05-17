//
//  Date.swift
//  Dr.Ink
//
//  Created by Inwoo Park on 2022/05/17.
//

import Foundation

extension Date {
    func dateToString() -> String {
        let myDateFormatter = DateFormatter()
        myDateFormatter.dateFormat = "yyyy년 MM월 dd일"
        myDateFormatter.locale = Locale(identifier:"ko_KR")
        let convertStr = myDateFormatter.string(from: self)
        return convertStr
    }
}
