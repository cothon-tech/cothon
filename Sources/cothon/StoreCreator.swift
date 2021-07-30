//
//  File.swift
//  
//
//  Created by Andrej Malyhin on 18.07.21.
//

import Foundation

func createStore() -> Store<CothonState, CothonAction> {
    .init(
        inital: CothonState(),
        reducer: reducer,
        environment: cothonEnvironment)
}
