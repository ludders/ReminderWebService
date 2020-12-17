//
//  Web.swift
//  GuitarSales
//
//  Created by dludlow7 on 03/12/2020.
//

import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

class Web {
    let session: Session

    init(session: Session) {
        self.session = session
    }

    func fetchObject<T>(from url: URL) -> T? where T: Codable {
        let semaphore = DispatchSemaphore(value: 0)
        var object: T?

        print(url)
        session.dataTask(with: url) { data in
            let decoder = JSONDecoder()
            object = try? decoder.decode(T.self, from: data)
            semaphore.signal()
        }
        _ = semaphore.wait(timeout: .distantFuture)

        return object
    }
}
