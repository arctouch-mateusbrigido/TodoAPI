import Vapor
import Fluent
import FluentMySQLDriver

enum APIVersion: String {
    case v1 = "v1"
    case v2 = "v2"
}

public func configure(_ app: Application) throws {
    app.passwords.use(.bcrypt)

    try registerUserRoutes(app, version: .v1)
    try registerTaskRoutes(app, version: .v1)
    try routes(app, version: .v1)

    var tls = TLSConfiguration.makeClientConfiguration()
    tls.certificateVerification = .none

    let configuration = DatabaseConfigurationFactory.mysql(hostname: Environment.get("DATABASE_HOST") ?? "localhost",
                                                           username: Environment.get("DATABASE_USERNAME") ?? "vapor_username",
                                                           password: Environment.get("DATABASE_PASSWORD") ?? "vapor_password",
                                                           database: Environment.get("DATABASE_NAME") ?? "vapor_database",
                                                           tlsConfiguration: tls)
    app.databases.use(configuration, as: .mysql)
}
