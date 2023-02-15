//
//  RocketDetailsViewModel.swift
//  SpaceXApp
//
//  Created by Mohamed Mahmoud on 15/02/2023.
//

import Foundation
import Combine

class RocketDetailsViewModel: ObservableObject {
    
    @Published var rocketData: Rocket?
    private var bags = Set<AnyCancellable>()
    private var service: RocketDetailsServiceProtocol?
    
    init(service: RocketDetailsServiceProtocol = RocketDetailsService(), rocketId: String) {
        self.service = service
        getRocketDetails(id: rocketId)
    }
    
    func getRocketDetails(id: String) {
        self.service?.getRocketDetails(id: id)
            .sink(receiveCompletion: { completion in
                // handle error when there are no data
            }, receiveValue: { [weak self] rocket in
                self?.rocketData = rocket
            }).store(in: &bags)
    }
}
