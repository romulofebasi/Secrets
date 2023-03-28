//
//  ViewController+Push.swift
//  Secrets
//
//  Created by Rômulo Lobo on 28/03/23.
//

import Foundation

extension ViewController {
    @available(*, deprecated, message: "Use present(view: View) instead")
    func present(viewController: ViewController) {
        coordinator?.navigate(to: viewController)
    }
    
    func present(view: CoordinatorView) {
        coordinator?.navigate(to: view.controller)
    }
}
