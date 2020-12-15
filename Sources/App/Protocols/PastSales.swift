//
//  PastSales.swift
//  GuitarSales
//
//  Created by dludlow7 on 03/12/2020.
//

import Foundation

protocol PastSales {
    func get(product: Product, startDate: Date, endDate: Date) -> Int
}
