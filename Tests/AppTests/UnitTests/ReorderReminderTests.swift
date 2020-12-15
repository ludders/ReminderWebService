//
//  ReorderReminderTests.swift
//  GuitarSalesTests
//
//  Created by Hasan Akoglu on 08/10/2020.
//

import XCTest
@testable import App

class ReorderReminderTests: XCTestCase {
    func testProductNeedsRestocking() {
        let reminder: MockReminder = MockReminder()
        let warehouseStub = WarehouseStub(description: "Fender Player Stratocaster w/ Maple Fretboard in Buttercream", stockLevel: 6)
        let reorderLevelStub = ReorderLevelStub(reorderLevel: 3)
        let reorderChecker = ReorderChecker(warehouse: warehouseStub, reorderLevel: reorderLevelStub, message: Message())
        let message = reorderChecker.onSale(id: 757, quantity: 4)
        XCTAssertEqual(message, "757 Fender Player Stratocaster w/ Maple Fretboard in Buttercream is running low. Please order more.")
    }
    
    func testProductDoesNotNeedRestocking() {
        let reminder: MockReminder = MockReminder()
        let warehouseStub = WarehouseStub(description: "", stockLevel: 6)
        let reorderLevelStub = ReorderLevelStub(reorderLevel: 3)
        let reorderChecker = ReorderChecker(warehouse: warehouseStub, reorderLevel: reorderLevelStub, message: Message())
        let message = reorderChecker.onSale(id: 757, quantity: 1)
        XCTAssertEqual(message, "OK")
    }
}

class MockReminder: Reminder {
    var message: String = ""
    
    func sendReminder(message: String) {
        self.message = message
    }
}

struct WarehouseStub: Warehouse {
    var description: String
    var stockLevel: Int
    
    func fetchProduct(id: Int) -> Product {
        return Product(id: id,
                       description: description,
                       stock: stockLevel,
                       leadTime: 0)
    }
}

struct ReorderLevelStub: Reorder {
    var reorderLevel: Int
    
    func fetchReorderLevel(product: Product) -> Int {
        return reorderLevel
    }
}
