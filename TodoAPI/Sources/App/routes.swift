import Fluent
import Vapor

func routes(_ app: Application, version: APIVersion) throws {
    let versioned = app.grouped(PathComponent(stringLiteral: version.rawValue))

    versioned.get { req async in
        "It works!"
    }
}
