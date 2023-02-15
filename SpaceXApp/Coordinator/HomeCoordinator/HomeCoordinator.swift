//
//  HomeCoordinator.swift
//  SpaceXApp
//
//  Created by Mohamed Mahmoud on 14/02/2023.
//

import UIKit

class HomeCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vc = HomeViewController.instantiate()
        vc.setViewModel(coordinator: self)
        navigationController.pushViewController(vc, animated: false)
    }
    
    func navigateToLaunchDetails(rocket: Launches) {
        let rocketDetailsVC = RocketDetailsViewController.instantiate()
        rocketDetailsVC.set(rocket: rocket)
        navigationController.pushViewController(rocketDetailsVC, animated: true)
    }
}
