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

    var tls = TLSConfiguration.makeClientConfiguration()
    tls.certificateVerification = .none

    let configuration = DatabaseConfigurationFactory.mysql(hostname: "mateusbrigido-1.cgesmw9rjd7a.us-east-1.rds.amazonaws.com",
                                                           username: "admin",
                                                           password: "123pipoca",
                                                           database: "Todo",
                                                           tlsConfiguration: tls)
    app.databases.use(configuration, as: .mysql)
}
