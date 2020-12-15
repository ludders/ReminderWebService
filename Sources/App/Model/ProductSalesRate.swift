//
//  ProductSalesRate.swift
//  ReminderWebService
//
//  Created by dludlow7 on 15/10/2020.
//

import Foundation

struct ProductSalesRate: SalesRate {
    let fetchDate: () -> Date
    let pastSales: PastSales

    fileprivate func averageDailySales(_ product: Product, _ startDate: Date, _ endDate: Date, days: Int) -> Double {
        return Double(pastSales.get(product: product, startDate: startDate, endDate: endDate))/(Double(days))
    }
    
    func get(product: Product) -> Double {
        let date = fetchDate()
        var result: Double = averageDailySales(product, date.startDateLastYear, date.endDateLastYear, days: date.daysInMonth)
        if result == 0 {
            result = averageDailySales(product, date.startDate, date.endDate, days: 30)
        }
        return result
    }
}


