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
        super.init()
        let view = HomeView()
        view.viewModel = HomeViewModel()
        view.delegate = self
        UserDefaults.standard.set(false, forKey: "logged")
        navigationItem.hidesBackButton = true
        self.view = view
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension HomeViewController: HomeViewDelegate {
    func onTapButton() {
        // TODO: inserir pop no coordinator do módulo `Constraints`
        coordinator?.navigationController?.popViewController(animated: true)
    }
}
