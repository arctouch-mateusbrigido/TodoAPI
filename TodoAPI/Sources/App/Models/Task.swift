import Fluent
import Vapor

final class Task: Model, Content {
    static let schema = "Task"

    @ID(custom: "id", generatedBy: .user)
    var id: UUID?
    @Field(key: "description")
    var description: String
    @Field(key: "dueDate")
    var dueDate: Date
    @Field(key: "completed")
    var completed: Bool
    @Parent(key: "user_id")
    var user: User

    init() {
        self.id = UUID()
    }

    internal init(id: UUID = UUID(), description: String, dueDate: Date, completed: Bool, user: User) {
        self.id = id
        self.description = description
        self.dueDate = dueDate
        self.completed = completed
        self.$user.id = user.id!
    }
}
