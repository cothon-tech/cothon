import Foundation

enum CothonRunnerError: Error {
    case noFileExists
}

struct CothonRunnerDependencies {
    let fileExistsAtPath: (String) -> Bool
    let contentOfURL: (URL) -> [URL]
}

let dependecies = CothonRunnerDependencies(
    fileExistsAtPath: { path in
        FileManager.default.fileExists(atPath: path)
    },
    contentOfURL: { url in
        let enumerator = FileManager.default.enumerator(at: url, includingPropertiesForKeys: nil)
        var files = [URL]()
        while let nextURL = enumerator?.nextObject() as? URL {
            if nextURL.hasDirectoryPath {
                continue
            }
            
            files.append(nextURL)
        }
        return files
    }
)

import SwiftSyntax


let cothon = Cothon()

let rulesRegistry: [QualityGate] = [
    .filesShorterThan400Lines()
]

struct CothonRunner {
    func run(
        path: String,
        dependencies: CothonRunnerDependencies) throws
    {
        guard dependencies.fileExistsAtPath(path) else { throw CothonRunnerError.noFileExists }
        
        let filesURLs = dependencies.contentOfURL(URL(fileURLWithPath: path))
        
        cothon.filesInfos = filesURLs.map { FileScanner.live().scan($0) }
        
        rulesRegistry.forEach { $0.execute(cothon) }
    }
}
