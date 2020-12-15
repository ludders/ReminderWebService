//
//  WarehouseWebAPI.swift
//  GuitarSales
//
//  Created by Hasan Akoglu on 22/10/2020.
//

import Foundation

class WarehouseWebAPI: Warehouse {
    let web: Web
    var urlString = "https://6hr1390c1j.execute-api.us-east-2.amazonaws.com/default/product?id="
    
    init(web: Web) {
        self.web = web
    }

    func fetchProduct(id: Int) -> Product {
        urlString = urlString + String(id)
        let url = URL(string: urlString)!
        guard let product: Product = web.fetchObject(from: url) else {
            return Product(id: 0, description: "", stock: 0, leadTime: 0)
        }
        return product
    }
}
