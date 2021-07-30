import Foundation
import ArgumentParser

let store = createStore()

struct CothonCommand: ParsableCommand {
    //@Option(name: .shortAndLong, help: "The path of your project.")
    var path = FileManager.default.currentDirectoryPath
    
    func run() throws {        
        store.dispatch(.setConfiguration(.init(path: path, ignoredFiles: [])))
    }
}
