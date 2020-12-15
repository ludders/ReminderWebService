//
//  Product.swift
//  ReminderWebService
//
//  Created by dludlow7 on 03/12/2020.
//

import Foundation

struct Product: Codable {
    let id: Int
    let description: String
    let stock: Int
    let leadTime: Int
}
