@testable import App
import XCTVapor

final class AppTests: XCTestCase {
    func testHelloWorld() throws {
        let app = Application(.testing)
        defer { app.shutdown() }
        try configure(app)

        try app.test(.GET, "guitarsales", afterResponse: { res in
            XCTAssertEqual(res.status, .badRequest)
            XCTAssertEqual(res.body.string, "{\"error\":true,\"reason\":\"productId is required, quantity is required\"}")
        })
    }
}
