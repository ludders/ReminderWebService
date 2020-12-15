//
//  ReorderLevel.swift
//  ReminderWebService
//
//  Created by dludlow7 on 27/11/2020.
//

import Foundation

struct ReorderLevel: Reorder {
    var salesRate: SalesRate

    func fetchReorderLevel(product: Product) -> Int {
        return Int((salesRate.get(product: product) * Double(product.leadTime)).rounded(.up))
    }
}
