//
//  Reporter.swift
//  
//
//  Created by Andrej Malyhin on 11.07.21.
//

import Foundation

struct Reporter {
    let report: (Rule) -> ()
}

extension Reporter {
    static func console() -> Self {
        .init { rule in
            print(rule)
        }
    }
}

let defaultReporters: [Reporter] = [.console()]
