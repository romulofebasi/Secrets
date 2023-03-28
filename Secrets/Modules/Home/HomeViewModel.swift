//
//  HomeViewModel.swift
//  Secrets
//
//  Created by Rômulo Lobo on 28/03/23.
//

import Foundation

internal protocol HomeViewModelProtocol: ViewModel {
    var text: String { get }
}

internal struct HomeViewModel: HomeViewModelProtocol {
    let text: String
    
    init() {
        self.text = "Texto"
    }
}
