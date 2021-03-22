//
//  AppCoordinator.swift
//  ahmed_chebbi_ios_challenge
//
//  Created by Chebbi on 22/03/2021.
//

import UIKit

protocol Coordinator: class {
    var childCoordinators: [Coordinator] { get }
    func start()
}

final class AppCoordinator: Coordinator {
    
    private(set) var childCoordinators: [Coordinator] = []
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start(){
        let navigationController = UINavigationController()
        let banksListCoordinator = BanksListCoordinator(navigationController: navigationController)
        childCoordinators.append(banksListCoordinator)
        banksListCoordinator.start()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
}
