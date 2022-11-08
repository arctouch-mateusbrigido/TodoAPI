import Fluent
import Vapor

func patch(tasksRoute: RoutesBuilder) {
    tasksRoute
        .patch(":id") { request -> Task.Response in
            let user = try request.auth.require(User.self)
            let patch = try request.content.decode(PatchRequest.self)

            guard let task = try await Task.find(request.parameters.get("id"), on: request.db),
                  task.$user.id == user.id  else {
                throw Abort(.notFound)
            }

            patch.patch(task: task)
            try await task.save(on: request.db)
            return task.toResponse()
        }
}

private struct PatchRequest: Content {
    var description: String?
    var dueDate: Date?
    var completed: Bool?

    func patch(task: Task) {
        if let description {
            task.description = description
        }

        if let dueDate {
            task.dueDate = dueDate
        }

        if let completed {
            task.completed = completed
        }
    }
}
