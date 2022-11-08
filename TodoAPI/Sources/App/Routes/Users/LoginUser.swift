import Vapor
import Fluent

func login(userRoute: RoutesBuilder) {
    userRoute
        .grouped(User.authenticator())
        .post("login") { request -> User.UserResponse in
            let user = try request.auth.require(User.self)
            let token = try user.generateToken()
            try await token.save(on: request.db)

            return user.asResponse(with: token)
        }
}
