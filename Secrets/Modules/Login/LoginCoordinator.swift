//
//  LoginCoordinator.swift
//  Secrets
//
//  Created by Rômulo Lobo on 26/03/23.
//

import UIKit

final class LoginCoordinator: Coordinator {
    override func start() {
        super.start()
        
        let vc = LoginViewController()
        vc.coordinator = self
        
        navigate(to: vc)
    }
}
