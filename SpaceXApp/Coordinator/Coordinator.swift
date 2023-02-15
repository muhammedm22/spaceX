//
//  Coordinator.swift
//  SpaceXApp
//
//  Created by Mohamed Mahmoud on 14/02/2023.
//

import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
}
