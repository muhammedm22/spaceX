//
//  RocketDetailsProvider.swift
//  SpaceXApp
//
//  Created by Mohamed Mahmoud on 15/02/2023.
//

import Foundation
import Moya

enum RocketDetailsProvider {
    case getRocketDetails(id: String)
}

extension RocketDetailsProvider: TargetType {
    var baseURL: URL {
        return URL(string: APP_BASE_URL)!
    }
    
    var path: String {
        switch self {
        case let .getRocketDetails(id):
            return "/v4/launches/\(id)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getRocketDetails:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getRocketDetails:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
}
