//
//  MainCoordinator.swift
//  Secrets
//
//  Created by Rômulo Lobo on 28/03/23.
//

import UIKit

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
            navigate(to: CoordinatorView.home.controller)
        } else {
            navigate(to: LoginCoordinator())
        }
    }
}
