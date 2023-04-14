//
//  HomeViewController.swift
//  Secrets
//
//  Created by Rômulo Lobo on 28/03/23.
//

import UIKit
import Constraints

final class HomeViewController: ViewController {
    override init() {
        let view = HomeView()
        view.viewModel = HomeViewModel()
        
        super.init()
        
        self.view = view
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
