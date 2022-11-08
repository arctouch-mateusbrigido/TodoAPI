import Vapor

extension Task {
    struct CreateRequest: Content {
        var description: String
        var dueDate: Date

        func toTask(with user: User) -> Task {
            Task(description: description, dueDate: dueDate, completed: false, user: user)
        }
    }
}

extension Task {
    struct Response: Content {
        enum Status: String, Content {
            case ongoing
            case completed
        }

        var id: UUID?
        var description: String
        var dueDate: Date
        fileprivate var completed: Bool

        var status: Status {
            completed ? .completed : .ongoing
        }
    }

    func toResponse() -> Task.Response {
        Task.Response(id: id, description: description, dueDate: dueDate, completed: completed)
    }
}
