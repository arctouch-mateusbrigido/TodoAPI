import Fluent
import Vapor

func addTask(tasksRoute: RoutesBuilder) {
    tasksRoute
        .post { request async throws -> Task.Response in
            let user = try request.auth.require(User.self)
            let task = try request.content.decode(Task.CreateRequest.self).toTask(with: user)

            try await task.save(on: request.db)
            return task.toResponse()
        }
}
