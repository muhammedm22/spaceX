//
//  RocketDetailsService.swift
//  SpaceXApp
//
//  Created by Mohamed Mahmoud on 15/02/2023.
//

import Foundation
import Moya
import CombineMoya
import Combine

protocol RocketDetailsServiceProtocol {
    func getRocketDetails(id: String) -> AnyPublisher<Rocket, Error>
}
class RocketDetailsService: RocketDetailsServiceProtocol {
    private let provider = MoyaProvider<RocketDetailsProvider>()
    
    deinit {
        print("services has been deinit:")
    }
    
    func getRocketDetails(id: String) -> AnyPublisher<Rocket, Error> {
        return self.provider.requestPublisher(.getRocketDetails(id: id))
            .map{$0.data}
            .decode(type: Rocket.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
