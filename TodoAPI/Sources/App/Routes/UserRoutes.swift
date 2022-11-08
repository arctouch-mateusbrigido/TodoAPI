import Vapor
import FluentSQL

func registerUserRoutes(_ app: Application, version: APIVersion) throws {
    let userRoute = app
        .grouped(PathComponent(stringLiteral: version.rawValue))
        .grouped("users")

    login(userRoute: userRoute)
    register(userRoute: userRoute)
    delete(userRoute: userRoute)
    me(userRoute: userRoute)
}
