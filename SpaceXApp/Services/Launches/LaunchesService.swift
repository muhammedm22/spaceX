//
//  LaunchesService.swift
//  SpaceXApp
//
//  Created by Mohamed Mahmoud on 11/02/2023.
//

import Foundation
import Moya
import CombineMoya
import Combine

protocol LaunchesServiceProtocol {
    func getLaunhces() -> AnyPublisher<[Launches], Error>
}
class LaunchesService: LaunchesServiceProtocol {
    private let provider = MoyaProvider<LaunchesProvider>()
    
    deinit {
        print("services has been deinit:")
    }
    
    func getLaunhces() -> AnyPublisher<[Launches], Error> {
        return self.provider.requestPublisher(.getLauches)
            .map{$0.data}
            .decode(type: [Launches].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
