//
//  BanksListCoordinator.swift
//  ahmed_chebbi_ios_challenge
//
//  Created by Chebbi on 22/03/2021.
//

import UIKit

final class BanksListCoordinator: Coordinator {
    private(set) var childCoordinators: [Coordinator] = []
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.navigationController.navigationBar.prefersLargeTitles = true
    }
    
    func start() {
        let banksListViewModel = BanksListViewModel(coordinator: self)
        var banksListViewController = BanksListViewController()
        banksListViewController.bind(toViewModel: banksListViewModel)
        navigationController.setViewControllers([banksListViewController], animated: false)
    }
 
    func childDidFinish(_ coordinator: Coordinator) {
        if let index = childCoordinators.firstIndex(where: {
              coordinator === $0
        }) {
            childCoordinators.remove(at: index)
        }
    }
}
