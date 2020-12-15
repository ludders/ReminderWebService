//
//  File.swift
//  
//
//  Created by dludlow7 on 15/12/2020.
//

import Foundation

class ReorderChecker {
    let warehouse: Warehouse
    let reorderLevel: Reorder
    let message : Message

    init(warehouse: Warehouse, reorderLevel: Reorder, message: Message) {
        self.warehouse = warehouse
        self.reorderLevel = reorderLevel
        self.message = message
    }

    func onSale(id: Int, quantity: Int) -> String {
        let product = warehouse.fetchProduct(id: id)
        if quantity > (product.stock - reorderLevel.fetchReorderLevel(product: product)) {
            return message.buildMessage(for: product)
        } else {
            return "OK"
        }
    }
}
