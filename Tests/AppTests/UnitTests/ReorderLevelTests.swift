//
//  ReorderLevelTests.swift
//  GuitarSalesTests
//
//  Created by dludlow7 on 15/10/2020.
//

import XCTest
@testable import App

class ReorderLevelTests: XCTestCase {
    func testCalculateReorderLevel() {
        let salesRateStub: SalesRate = SalesRateStub(rate: 2)
        let reorder: Reorder = ReorderLevel(salesRate: salesRateStub)
        let product = Product(id: 757, description: "", stock: 1, leadTime: 14)
        XCTAssertEqual(reorder.fetchReorderLevel(product: product), 28)
    }
}

struct SalesRateStub: SalesRate {
    var rate: Double

    func get(product: Product) -> Double {
        return rate
    }
}

