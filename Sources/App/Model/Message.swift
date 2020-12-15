//
//  Message.swift
//  ReminderWebService
//
//  Created by dludlow7 on 03/12/2020.
//

import Foundation

class Message {
    func buildMessage(for product: Product) -> String {
        return "\(product.id) \(product.description) is running low. Please order more."
    }
}
