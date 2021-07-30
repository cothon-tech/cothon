//
//  CothonReducer.swift
//  
//
//  Created by Andrej Malyhin on 16.07.21.
//

import Foundation

let reducer: Reducer<CothonState, CothonAction, CothonEnvironment> = Reducer { state, action, env in
    switch action {
    case .setConfiguration(let config):
        let content = env.contentOfURL(URL(fileURLWithPath: config.path))
        state.filesInfos = env.filesInfos(content)
    }
}
