import Fluent
import Vapor

func me(userRoute: RoutesBuilder) {
    userRoute
        .grouped(UserToken.authenticator())
        .get("me") { request -> User.UserResponse in
            let user = try request.auth.require(User.self)
            return user.asResponse()
        }
}
