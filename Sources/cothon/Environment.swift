//
//  CothonEnvironment.swift
//  
//
//  Created by Andrej Malyhin on 18.07.21.
//

import Foundation

struct CothonEnvironment {
    let fileExisitsAtPath: (String) -> Bool
    let contentOfURL: (URL) -> [URL]
    let filesInfos: ([URL]) -> [FileInfo]
    
    init(
        fileExisitsAtPath: @escaping (String) -> Bool,
        contentOfURL: @escaping (URL) -> [URL],
        filesInfos: @escaping ([URL]) -> [FileInfo]
    ) {
        self.fileExisitsAtPath = fileExisitsAtPath
        self.contentOfURL = contentOfURL
        self.filesInfos = filesInfos
    }
}

let cothonEnvironment = CothonEnvironment(
    fileExisitsAtPath: { path in
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
    },
    filesInfos: { urls in
        urls.map { FileScanner.live().scan($0) } 
    }
)
