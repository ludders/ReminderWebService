//
//  Session.swift
//  GuitarSales
//
//  Created by Hasan Akoglu on 12/11/2020.
//

import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

protocol Session {
    func dataTask(with url: URL, _ completion: @escaping (Data) -> Void)
}

class URLSessionWrapper: Session {
    let session: URLSession = URLSession.shared
    
    func dataTask(with url: URL, _ completion: @escaping (Data) -> Void) {
        session.dataTask(with: url) { (data, _, _) in
            if let data = data {
                completion(data)
            }
        }.resume()
    }
}
