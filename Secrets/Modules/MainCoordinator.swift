//
//  MainCoordinator.swift
//  Secrets
//
//  Created by Rômulo Lobo on 28/03/23.
//

import UIKit
import Constraints

protocol MainCoordinatorProtocol {
    func flow()
}

final class MainCoordinator: Coordinator, MainCoordinatorProtocol {
    override func start() {
        super.start()
        flow()
    }
    
    func flow() {
        if UserDefaults.standard.bool(forKey: "logged") {
            navigate(to: Screens.home)
        } else {
            navigate(to: LoginCoordinator())
        }
    }
}

enum Screens: CoordinatorViewProtocol {
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
