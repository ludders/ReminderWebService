//
//  SalesHistoryContractTests.swift
//  GuitarSalesTests
//
//  Created by Hasan Akoglu on 12/11/2020.
//

import Foundation
@testable import App

class SalesHistoryContractTests: SalesHistoryTestBase {
    override func createSalesHistory() -> SalesHistoryAPI {
        let urlSessionWrapper: URLSessionWrapper = URLSessionWrapper()
        return SalesHistoryAPI(web: Web(session: urlSessionWrapper))
    }
    
    func testFetchSalesTotalForProduct() {
        fetchSalesTotalForProduct()
    }
}
