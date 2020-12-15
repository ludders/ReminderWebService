//
//  SalesRateTests.swift
//  GuitarSalesTests
//
//  Created by dludlow7 on 15/10/2020.
//

import XCTest
@testable import App

class SalesRateTests: XCTestCase {
    fileprivate func getDate(dateString: String) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter.date(from: dateString)!
    }
 
    var mockPastSales: MockPastSales!
    var product: Product!
    var productSalesRate: ProductSalesRate!
    
    override func setUp() {
        mockPastSales = MockPastSales()
        product = Product(id: 757, description: "", stock: 1, leadTime: 0)
        productSalesRate = ProductSalesRate(fetchDate: {
            return self.getDate(dateString: "15/10/2020")
        }, pastSales: mockPastSales)
    }

    func testUsingLastYearsData() {
        XCTAssertEqual(productSalesRate.get(product: product), 1)
    }

    func testStartAndEndDateLastYear() {
        let startDate = self.getDate(dateString: "01/10/2019")
        let endDate = self.getDate(dateString: "31/10/2019")

        _ = productSalesRate.get(product: product)
        XCTAssertEqual(mockPastSales.startDate, startDate)
        XCTAssertEqual(mockPastSales.endDate, endDate)
    }

    func testDateInDifferentMonth() {
        let productSalesRate = ProductSalesRate(fetchDate: {
            return self.getDate(dateString: "15/02/2020")
        }, pastSales: mockPastSales)
        XCTAssertEqual(productSalesRate.get(product: product), 1.107, accuracy: 0.001)
    }
    
    func testUsingRecentData() {
        mockPastSales.sales = [31,0]
        XCTAssertEqual(productSalesRate.get(product: product), 1.033, accuracy: 0.001)
    }
    
    func testStartAndEndDate() {
        mockPastSales.sales = [31,0]
        let startDate = self.getDate(dateString: "15/09/2020")
        let endDate = self.getDate(dateString: "14/10/2020")
        
        _ = productSalesRate.get(product: product)
        XCTAssertEqual(mockPastSales.startDate, startDate)
        XCTAssertEqual(mockPastSales.endDate, endDate)
    }
}

class MockPastSales: PastSales {
    var sales: [Int] = [31]
    var startDate: Date?
    var endDate: Date?

    func get(product: Product, startDate: Date, endDate: Date) -> Int {
        self.startDate = startDate
        self.endDate = endDate
        return sales.popLast()!
    }
}
