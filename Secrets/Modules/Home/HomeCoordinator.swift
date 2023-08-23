//
//  HomeCoordinator.swift
//  Secrets
//
//  Created by Rômulo Lobo on 06/08/23.
//

import UIKit
import Constraints

final class HomeCoordinator: Coordinator {
    override func start() {
        super.start()
        navigate(to: Screens.home)
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
