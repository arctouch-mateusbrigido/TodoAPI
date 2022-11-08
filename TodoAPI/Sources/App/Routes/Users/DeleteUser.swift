import Vapor
import Fluent

func delete(userRoute: RoutesBuilder) {
    userRoute
        .grouped(UserToken.authenticator())
        .delete(":id") { request -> User.UserResponse in
            let user = try request.auth.require(User.self)
            guard let uuidString = request.parameters.get("id"),
                  let uuid = UUID(uuidString: uuidString),
                  user.id == uuid else {
                throw Abort(.internalServerError)
            }

            try await user.delete(on: request.db)
            return user.asResponse()
        }
}
