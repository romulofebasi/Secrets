//
//  NavigationController+Alias.swift
//  Secrets
//
//  Created by Rômulo Lobo on 28/03/23.
//

import UIKit

extension UINavigationController {
    func push(_ viewController: UIViewController) {
        self.pushViewController(viewController)
    }
    
    func push(_ viewController: UIViewController, animated: Bool) {
        self.pushViewController(viewController, animated: animated)
    }
    
    func pushViewController(_ viewController: UIViewController) {
        self.pushViewController(viewController, animated: true)
    }
}
