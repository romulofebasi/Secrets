//
//  LoginViewModel.swift
//  Secrets
//
//  Created by Rômulo Lobo on 28/03/23.
//

import Foundation
import Constraints

internal protocol LoginViewModelProtocol: ViewModel {
    var text: String { get }
}

internal struct LoginViewModel: LoginViewModelProtocol {
    let text: String
    
    init() {
        self.text = "Login"
    }
}

