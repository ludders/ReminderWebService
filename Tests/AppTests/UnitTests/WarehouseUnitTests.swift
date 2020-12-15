//
//  WarehouseUnitTests.swift
//  GuitarSalesTests
//
//  Created by Hasan Akoglu on 12/11/2020.
//

import Foundation
@testable import App

class WarehouseUnitTests: WarehouseTestBase {
    override func createWarehouse() -> WarehouseWebAPI {
        let json =
        """
        {"id":757,"make":"Fender","range":"Player","model":"Stratocaster","description":"Fender Player Stratocaster w/ Maple Fretboard in Buttercream","price":549,"stock":12,"rackspace":20,"leadTime":14,"minOrder":10}
        """
        let sessionStub: Session = SessionStub(json: json)
        return WarehouseWebAPI(web: Web(session: sessionStub))
    }
    
    func testProductHasRequestedId() {
        productHasRequestedId()
    }
}

class SessionStub: Session {
    let json: String
    
    init(json: String) {
        self.json = json
    }
    
    func dataTask(with url: URL, _ completion: @escaping (Data) -> Void) {
        completion(json.data(using: .utf8)!)
    }
}
