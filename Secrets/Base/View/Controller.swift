//
//  Controller.swift
//  Secrets
//
//  Created by Rômulo Lobo on 26/03/23.
//

import UIKit

internal protocol ViewControllerProtocol {
    var coordinator: Coordinator? { get set }
}

class ViewController: UIViewController, ViewControllerProtocol {
    var coordinator: Coordinator?
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
