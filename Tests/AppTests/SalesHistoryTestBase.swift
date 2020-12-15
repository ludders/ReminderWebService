//
//  SalesHistoryTestBase.swift
//  GuitarSalesTests
//
//  Created by Hasan Akoglu on 12/11/2020.
//

import Foundation
import XCTest
@testable import App

class SalesHistoryTestBase: XCTestCase {
    func createSalesHistory() -> SalesHistoryAPI {
        fatalError()
    }
    
    func fetchSalesTotalForProduct() {
        let product = Product(id: 811, description: "", stock: 0, leadTime: 0)
        let startDate = "17/7/2019".toDate()
        let endDate = "27/7/2019".toDate()
        let salesHistoryAPI = createSalesHistory()
        let total = salesHistoryAPI.get(product: product, startDate: startDate, endDate: endDate)
        XCTAssertGreaterThan(total, 0)
    }
}
