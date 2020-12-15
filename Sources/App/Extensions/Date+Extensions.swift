//
//  Date+Extensions.swift
//  ReminderWebService
//
//  Created by dludlow7 on 03/12/2020.
//

import Foundation

extension Date {
    var startDate: Date {
        return Calendar.current.date(byAdding: .day, value: -30, to: self)!
    }

    var endDate: Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: self)!
    }

    var startDateLastYear: Date {
        let components: DateComponents = Calendar.current.dateComponents([.year, .month], from: self)
        let startOfMonth = Calendar.current.date(from: components)
        let startOfMonthLastYear = Calendar.current.date(byAdding: .year, value: -1, to: startOfMonth!)
        return startOfMonthLastYear!
    }

    var endDateLastYear: Date {
        let firstDayofNextMonth = Calendar.current.date(byAdding: .month, value: 1, to: self.startDateLastYear)
        let lastDayOfMonth = Calendar.current.date(byAdding: .day, value: -1, to: firstDayofNextMonth!)
        return lastDayOfMonth!
    }

    var daysInMonth: Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: startDateLastYear, to: endDateLastYear)
        return components.day! + 1
    }

    var asString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        return formatter.string(from: self)
    }
}
