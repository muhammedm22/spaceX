//
//  HomeViewModel.swift
//  SpaceXApp
//
//  Created by Mohamed Mahmoud on 11/02/2023.
//

import Foundation
import Combine

protocol HomeViewModelProtocol {
    func didSelectRocket(index: Int)
}
final class HomeViewModel: HomeViewModelProtocol {
    
    private struct Constants {
        let dateFormat: String = "yyyy-MM-dd'T'HH:mm:ssZ"
    }
    @Published var launches: [Launches] = []
    private let service: LaunchesServiceProtocol?
    private var bags = Set<AnyCancellable>()
    private weak var coordiator: HomeCoordinator?
    
    init(service: LaunchesServiceProtocol = LaunchesService(), coordinator: HomeCoordinator) {
        self.service = service
        self.coordiator = coordinator
        callAPI()
    }
    func didSelectRocket(index: Int) {
        guard let coordinator = coordiator else { return }
        coordinator.navigateToLaunchDetails(rocket: self.launches[index])
    }
    deinit {
        print("view model has beed deinit")
    }
    
    func callAPI() {
        self.service?.getLaunhces()
            .sink(receiveCompletion: { completion in
                // handle error when there are no data
            }, receiveValue: { [weak self] launches in
                self?.launches = self?.filteredData(launches: launches) ?? []
            }).store(in: &bags)
    }
    
    private func filteredData(launches: [Launches]) -> [Launches] {
        let filterBySuccess = launches.filter({ $0.success ?? false == true })
        let filterByDate = filterBySuccess.filter({
            let threeYearsAgoDate = Calendar.current.date(byAdding: .year, value: -3, to: Date())
            return Date.getDate(from: $0.date_local ?? "", format: Constants().dateFormat) > threeYearsAgoDate ?? Date()
        })
        return filterByDate
    }
    
}


