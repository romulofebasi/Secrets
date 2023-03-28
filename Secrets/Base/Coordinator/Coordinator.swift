//
//  Coordinator.swift
//  Secrets
//
//  Created by Rômulo Lobo on 26/03/23.
//

import UIKit

internal protocol CoordinatorProtocol {
    var navigationController: UINavigationController? { get set }
    
    func start()
    func navigate(to viewController: ViewController)
    func navigate(to coordinator: Coordinator)
}

class Coordinator: CoordinatorProtocol {
    var navigationController: UINavigationController?
    
    init() {
        // empty implementation
    }
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        // TODO: track self to analytics
    }
    
    func navigate(to viewController: ViewController) {
        guard let navigationController = navigationController else {
            return
        }
        
        viewController.coordinator = self
        navigationController.push(viewController)
    }
    
    func navigate(to coordinator: Coordinator) {
        coordinator.navigationController = self.navigationController
        coordinator.start()
    }
}

internal protocol CoordinatorViewProtocol {
    var controller: ViewController { get }
}

enum CoordinatorView: CoordinatorViewProtocol {
    case home
    case settings
    
    var controller: ViewController {
        switch self {
        case .home:
            return HomeViewController()
        case .settings:
            return LoginViewController()
        }
    }
}
