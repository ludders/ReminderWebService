//
//  WarehouseContractTests.swift
//  GuitarSalesTests
//
//  Created by Hasan Akoglu on 22/10/2020.
//

import XCTest
@testable import App

class WarehouseContractTests: WarehouseTestBase {
    override func createWarehouse() -> WarehouseWebAPI {
        let urlSessionWrapper: URLSessionWrapper = URLSessionWrapper()
        return WarehouseWebAPI(web: Web(session: urlSessionWrapper))
    }
    
    func testProductHasRequestedId() {
       productHasRequestedId()
    }
}
