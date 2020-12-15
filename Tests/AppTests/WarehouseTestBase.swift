//
//  WarehouseTestBase.swift
//  GuitarSalesTests
//
//  Created by Hasan Akoglu on 12/11/2020.
//

import Foundation
import XCTest
@testable import App

class WarehouseTestBase: XCTestCase {
    func createWarehouse() -> WarehouseWebAPI {
        fatalError()
    }
    
    func productHasRequestedId() {
        let warehouse: Warehouse = createWarehouse()
        let product = warehouse.fetchProduct(id: 757)
        XCTAssertEqual(product.id, 757)
    }
}
