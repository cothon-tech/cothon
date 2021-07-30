//
//  File.swift
//  
//
//  Created by Andrej Malyhin on 15.07.21.
//

import Foundation

final class Store<State, Action> {
    var state: State
    
    private let reducer: (inout State, Action) -> ()
    
    func dispatch(_ action: Action) {
        reducer(&state, action)
    }
    
    init<Environment>(
        inital: State,
        reducer: Reducer<State, Action, Environment>,
        environment: Environment) {
        state = inital
        self.reducer = { state, action in
            reducer(&state, action, environment)
        }
    }
}
