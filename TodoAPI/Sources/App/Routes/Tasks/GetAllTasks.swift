import Foundation
import Fluent
import Vapor

func getAll(tasksRoute: RoutesBuilder) {
    tasksRoute.get() { request async throws -> [Task.Response] in
        let user = try request.auth.require(User.self)
        let queryParameters = try request.query.decode(QueryParams.self)

        let query = Task.query(on: request.db)
            .field(\.$id).field(\.$description).field(\.$completed).field(\.$dueDate).field(\.$user.$id)
            .filter(\.$user.$id, .equal, user.id!)

        if let completed = queryParameters.completed {
            query.filter(\.$completed == completed)
        }

        if let dueDateAfter = queryParameters.dueDateAfter {
            query.filter(\.$dueDate >= dueDateAfter)
        }

        if let dueDateBefore = queryParameters.dueDateBefore {
            query.filter(\.$dueDate <= dueDateBefore)
        }

        let tasks = try await query.all()

        return tasks.map { $0.toResponse() }
    }
}

private struct QueryParams: Decodable {
    var completed: Bool?
    var dueDateBefore: Date?
    var dueDateAfter: Date?

    private static let dateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()

    enum CodingKeys: String, CodingKey {
        case completed
        case dueDateBefore = "dueDateBefore"
        case dueDateAfter = "dueDateAfter"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.completed = try container.decodeIfPresent(Bool.self, forKey: .completed)

        if let dateString = try? container.decodeIfPresent(String.self, forKey: .dueDateBefore) {
            self.dueDateBefore = Self.dateFormatter.date(from: dateString)
        } else {
            self.dueDateBefore = nil
        }

        if let dateString = try? container.decodeIfPresent(String.self, forKey: .dueDateAfter) {
            self.dueDateAfter = Self.dateFormatter.date(from: dateString)
        } else {
            self.dueDateAfter = nil
        }
    }
}
