//
//  SalesHistoryAPI.swift
//  GuitarSales
//
//  Created by Hasan Akoglu on 12/11/2020.
//

import Foundation

struct SalesHistory: Codable {
    let total: Int
}

class SalesHistoryAPI: PastSales {
    let web: Web
    let baseURL = "https://gjtvhjg8e9.execute-api.us-east-2.amazonaws.com/default/sales"
    
    init(web: Web) {
        self.web = web
    }
    
    func get(product: Product, startDate: Date, endDate: Date) -> Int {
        let urlString = "\(baseURL)?productId=\(product.id)&startDate=\(startDate.asString)&endDate=\(endDate.asString)&action=total"
        let url = URL(string: urlString)!
        guard let salesHistory: SalesHistory = web.fetchObject(from: url) else {
            return -1
        }
        return salesHistory.total
    }
}
