//
//  ReorderCheckerIntegrationTests.swift
//  GuitarSalesTests
//
//  Created by dludlow7 on 27/11/2020.
//

import XCTest
@testable import App

class ReorderCheckerIntegrationTests: XCTestCase {
    func testReorderMessageForItemLowInStock() {
        let session = URLSessionWrapper()
        let web = Web(session: session)
        let warehouse = WarehouseWebAPI(web: web)
        let pastSales = SalesHistoryAPI(web: web)
        let salesRate = ProductSalesRate(fetchDate: { return "01/08/2020".toDate() }, pastSales: pastSales)
        let reorderLevel = ReorderLevel(salesRate: salesRate)
        let reorderChecker = ReorderChecker(warehouse: warehouse, reorderLevel: reorderLevel, message: Message())
        let message = reorderChecker.onSale(id: 811, quantity: 50)
        XCTAssertEqual(message, "811 Epiphone Les Paul Classic In Worn Heritage Cherry Sunburst is running low. Please order more.")
    }
}
