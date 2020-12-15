//
//  SalesRate.swift
//  GuitarSales
//
//  Created by dludlow7 on 03/12/2020.
//

import Foundation

protocol SalesRate {
    func get(product: Product) -> Double
}
