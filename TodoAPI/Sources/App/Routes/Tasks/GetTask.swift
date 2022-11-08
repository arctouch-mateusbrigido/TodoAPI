import Fluent
import Vapor

func getTaskById(tasksRoute: RoutesBuilder) {
    tasksRoute.get(":id") { request async throws -> Task.Response in
        let user = try request.auth.require(User.self)

        guard let task = try await Task.find(request.parameters.get("id"), on: request.db),
              task.$user.id == user.id  else {
            throw Abort(.notFound)
        }

        return task.toResponse()
    }

}
