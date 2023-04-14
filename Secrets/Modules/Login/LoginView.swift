//
//  LoginView.swift
//  Secrets
//
//  Created by Rômulo Lobo on 28/03/23.
//

import UIKit
import Constraints

final class LoginView: View {
    var viewModel: LoginViewModelProtocol? {
        didSet {
            update()
        }
    }
    
    let label: UILabel
    
    override init() {
        self.label = UILabel()
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func update() {
        guard let model = viewModel else {
            return
        }
        
        label.text = model.text
    }
    
    override func configure() {}
    
    override func buildHierarchy() {
        addView(label)
    }
    
    override func buildConstraints() {
        label.layout.make { make in
            make.top.equalTo(layout.safeArea.top, constant: 20)
        }
    }
    
    override func render() {
        backgroundColor = .blue
    }
    
    override func buildAccessibility() {}
    override func updateAccessibility() {}
}

