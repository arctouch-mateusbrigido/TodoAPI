import Vapor

extension User {
    struct CreateRequest: Content, Validatable {
        var firstName: String
        var lastName: String
        var email: String
        var username: String
        var password: String

        static func validations(_ validations: inout Validations) {
            validations.add("firstName", as: String.self, is: !.empty)
            validations.add("lastName", as: String.self, is: !.empty)
            validations.add("email", as: String.self, is: .email)
            validations.add("username", as: String.self, is: !.empty)
            validations.add("password", as: String.self, is: .count(6...))
        }

        func asUser() throws -> User {
            User(firstName: firstName,
                 lastName: lastName,
                 email: email,
                 username: username,
                 password: try Bcrypt.hash(password))
        }
    }

    struct UserResponse: Content {
        var id: UUID?
        var firstName: String
        var lastName: String
        var email: String
        var username: String
        var token: String?
    }

    func asResponse(with token: UserToken? = nil) -> UserResponse {
        UserResponse(id: id,
                     firstName: firstName,
                     lastName: lastName,
                     email: email,
                     username: username,
                     token: token?.value)
    }
}
