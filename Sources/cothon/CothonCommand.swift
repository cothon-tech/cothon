import Foundation
import ArgumentParser

struct CothonCommand: ParsableCommand {
    @Option(name: .shortAndLong, help: "The path of your project.")
    var path = FileManager.default.currentDirectoryPath
        
    func run() throws {
        let runner = CothonRunner()
        try runner.run(path: path, dependencies: dependecies)
    }
}
