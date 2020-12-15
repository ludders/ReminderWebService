//
//  Reorder.swift
//  GuitarSales
//
//  Created by dludlow7 on 03/12/2020.
//

import Foundation

protocol Reorder {
    func fetchReorderLevel(product: Product) -> Int
}
