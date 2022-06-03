//
//  DateValue.swift
//  Dr.Ink
//
//  Created by Inwoo Park on 2022/06/03.
//

import Foundation

struct DateValue: Identifiable {
    var id = UUID().uuidString
    var day: Int
    var date: Date
}
