import Fluent
import Vapor

func delete(tasksRoute: RoutesBuilder) {
    tasksRoute
        .delete(":id") { request -> Task.Response in
            let user = try request.auth.require(User.self)
            guard let task = try await Task.find(request.parameters.get("id"), on: request.db),
                  task.$user.id == user.id else {
                throw Abort(.notFound)
            }

            try await task.delete(on: request.db)
            return task.toResponse()
        }
}
