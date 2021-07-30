//
//  File.swift
//  
//
//  Created by Andrej Malyhin on 15.07.21.
//

import Foundation

struct Reducer<State, Action, Environment> {
    let reduce: (inout State, Action, Environment) -> Void
    
    init(_ reduce: @escaping (inout State, Action, Environment) -> Void) {
        self.reduce = reduce
    }
    
    func callAsFunction(_ state: inout State, _ action: Action, _ environment: Environment) -> Void {
        reduce(&state, action, environment)
    }
}

