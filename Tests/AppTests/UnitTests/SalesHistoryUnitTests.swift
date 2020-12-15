//
//  SalesHistoryUnitTests.swift
//  GuitarSalesTests
//
//  Created by Hasan Akoglu on 12/11/2020.
//

import XCTest
@testable import App

class SalesHistoryUnitTests: SalesHistoryTestBase {
    override func createSalesHistory() -> SalesHistoryAPI {
        let json = """
        {"productID":811,"startDate":"7/17/2019","endDate":"7/27/2019","total":31}
        """
        let sessionStub = SessionStub(json: json)
        return SalesHistoryAPI(web: Web(session: sessionStub))
    }
    
    func testFetchSalesTotalForProduct() {
        fetchSalesTotalForProduct()
    }
}

extension String {
    func toDate() -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter.date(from: self)!
    }
}
