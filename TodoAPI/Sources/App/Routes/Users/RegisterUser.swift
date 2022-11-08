import Fluent
import Vapor

func register(userRoute: RoutesBuilder) {
    userRoute.post { req async throws -> User in
        try User.CreateRequest.validate(content: req)

        let create = try req.content.decode(User.CreateRequest.self)
        let user = try create.asUser()
        try await user.save(on: req.db)

        return user
    }
}
