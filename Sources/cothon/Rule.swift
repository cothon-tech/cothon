//
//  Rule.swift
//  
//
//  Created by Andrej Malyhin on 9.07.21.
//

import Foundation

struct Rule {
    let severity: Severity
    let description: String
}

struct QualityGate {
    let execute: (Cothon) -> ()
    
    static func filesShorterThan400Lines() -> Self {
        .init { cothon in
            let filesLongerThan400lines = cothon.filesInfos.filter { $0.numberOfLines > 400 }
            expect(filesLongerThan400lines.count == 0,
                   severity: .major,
                   description: "Files should not be bigger than 400 lines")
        }
    }
}

func expect(_ expression: @autoclosure () -> Bool, rule: Rule, reporters: [Reporter] = defaultReporters) {
    if !expression() {
        reporters.forEach { $0.report(rule)}
    }
}

func expect(_ expression: @autoclosure () -> Bool, severity: Severity, description: String, reporters: [Reporter] = defaultReporters) {
    expect(expression(), rule: .init(severity: severity, description: description))
}
