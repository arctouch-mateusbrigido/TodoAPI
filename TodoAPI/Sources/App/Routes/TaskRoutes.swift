import Fluent
import Vapor


func registerTaskRoutes(_ application: Application, version: APIVersion) throws {
    application
        .grouped(UserToken.authenticator())
        .grouped(PathComponent(stringLiteral: version.rawValue))
        .group("tasks") { tasks in

            getAll(tasksRoute: tasks)
            getTaskById(tasksRoute: tasks)
            addTask(tasksRoute: tasks)
            patch(tasksRoute: tasks)
            delete(tasksRoute: tasks)
        }
}
