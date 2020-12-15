import Vapor

func routes(_ app: Application) throws {
    app.get("guitarsales") { req -> String in
        try ReorderQuery.validate(query: req)
        let reorderQuery = try req.query.decode(ReorderQuery.self)
        return ReminderController.handle(reorderQuery)
    }
}

struct ReorderQuery: Content, Validatable {
    let productId: Int?
    let quantity: Int?

    static func validations(_ validations: inout Validations) {
        validations.add("productId", as: Int.self, is: .valid, required: true)
        validations.add("quantity", as: Int.self, is: .valid, required: true)
    }
}

//$ sudo lsof -i :8080
//Then kill offending process with:
//$ kill {PID of the process}
