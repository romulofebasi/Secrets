//
//  LoginCoordinator.swift
//  Secrets
//
//  Created by Rômulo Lobo on 28/03/23.
//

import UIKit
import Constraints

protocol LoginCoordinatorProtocol {
    func flow()
}

final class LoginCoordinator: Coordinator, LoginCoordinatorProtocol {
    override func start() {
        super.start()
        flow()
    }
    
    func flow() {
        if UserDefaults.standard.bool(forKey: "logged") {
            navigate(to: Screens.home)
        } else {
            navigate(to: WalkthroughViewController(transitionStyle: .scroll, navigationOrientation: .horizontal))
        }
    }
}
