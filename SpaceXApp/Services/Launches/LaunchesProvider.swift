//
//  LaunchesProvider.swift
//  SpaceXApp
//
//  Created by Mohamed Mahmoud on 11/02/2023.
//

import Foundation
import Moya

enum LaunchesProvider {
    case getLauches
}

extension LaunchesProvider: TargetType {
    var baseURL: URL {
        return URL(string: APP_BASE_URL)!
    }
    
    var path: String {
        switch self {
        case .getLauches:
            return "/v4/launches"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getLauches:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getLauches:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
}
