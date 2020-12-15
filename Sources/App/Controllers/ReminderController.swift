//
//  ReorderChecker.swift
//  ReminderWebService
//
//  Created by Hasan Akoglu on 08/10/2020.
//

import Foundation

class ReminderController {
    static func handle(_ query: ReorderQuery) -> String {
        let session = URLSessionWrapper()
        let web = Web(session: session)
        let warehouse = WarehouseWebAPI(web: web)
        let pastSales = SalesHistoryAPI(web: web)
        let salesRate = ProductSalesRate(fetchDate: { return Date() }, pastSales: pastSales)
        let reorderLevel = ReorderLevel(salesRate: salesRate)
        let reorderChecker = ReorderChecker(warehouse: warehouse, reorderLevel: reorderLevel, message: Message())
        return reorderChecker.onSale(id: query.productId!, quantity: query.quantity!)
    }
}
