import Foundation
import Vapor
import Fluent

func suggestionQuery(tasksRoute: RoutesBuilder) {
    tasksRoute
        .get("suggestions") { request async throws -> [String] in
            let user = try request.auth.require(User.self)

            let queryString: String = request.query["query"] ?? ""

            let query = Task.query(on: request.db)
                .field(\.$description)
                .filter(\.$description =~ queryString)

            let tasks = try await query.all()

            return tasks.map { $0.description}
        }
}
