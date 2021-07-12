import Foundation
import SwiftSyntax

struct FileInfo {
    let lines: [String]
    
    var numberOfLines: Int {
        lines.count
    }
}

struct FileScanner {
    let scan: (URL) -> FileInfo
    
    static func live() -> Self {
        .init { url in
            let syntax = try! SyntaxParser.parse(url)
            return FileInfo(lines: "\(syntax)".components(separatedBy: "\n"))
        }
    }
}
