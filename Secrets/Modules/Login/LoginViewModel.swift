//
//  LoginViewModel.swift
//  Secrets
//
//  Created by Rômulo Lobo on 28/03/23.
//

import Foundation
import Constraints

internal protocol LoginViewModelProtocol: ViewModel {
    var title: String { get }
    var buttonText: String { get }
}

internal struct LoginViewModel: LoginViewModelProtocol {
    let title: String
    let buttonText: String

    init() {
        self.title = "Projeto"
        self.buttonText = "Teste de Aplicativo"
    }
}

