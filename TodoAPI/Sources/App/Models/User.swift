import Vapor
import Fluent

final class User: Model, Content {
    static let schema = "User"

    @ID(custom: "id", generatedBy: .user)
    var id: UUID?
    @Field(key: "firstName")
    var firstName: String
    @Field(key: "lastName")
    var lastName: String
    @Field(key: "email")
    var email: String
    @Field(key: "username")
    var username: String
    @Field(key: "password")
    var password: String

    init() {
        self.id = UUID()
    }

    internal init(id: UUID = UUID(), firstName: String, lastName: String, email: String, username: String, password: String) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.username = username
        self.password = password
    }
}

extension User: ModelAuthenticatable {
    static let usernameKey = \User.$username
    static let passwordHashKey = \User.$password

    func verify(password: String) throws -> Bool {
        try Bcrypt.verify(password, created: self.password)
    }
}
