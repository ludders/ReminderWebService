//
//  Warehouse.swift
//  GuitarSales
//
//  Created by dludlow7 on 03/12/2020.
//

import Foundation

protocol Warehouse {
    func fetchProduct(id: Int) -> Product
}
