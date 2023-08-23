//
//  LoginViewController.swift
//  Secrets
//
//  Created by Rômulo Lobo on 28/03/23.
//

import UIKit
import Constraints

final class LoginViewController: ViewController {
    override init() {
        super.init()
        let view = LoginView()
        view.viewModel = LoginViewModel()
        view.delegate = self
        self.view = view
    }
    
    init(viewModel: LoginViewModelProtocol) {
        let view = LoginView()
        view.viewModel = viewModel
        super.init()
        self.view = view
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LoginViewController: LoginViewDelegate {
    func onTapButton() {
        coordinator?.navigate(to: HomeViewController())
    }
}
