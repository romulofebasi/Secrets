//
//  LoginView.swift
//  Secrets
//
//  Created by Rômulo Lobo on 28/03/23.
//

import UIKit
import Constraints
import Components

final class LoginView: View {
    var viewModel: LoginViewModelProtocol? {
        didSet {
            update()
        }
    }
    
    let titleLabel: UILabel
    let button: Button
    
    override init() {
        self.titleLabel = UILabel()
        self.button = Button(type: .primary)
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func update() {
        guard let model = viewModel else {
            return
        }
        
        titleLabel.text = model.title
        button.text = model.buttonText
    }
    
    override func configure() {}
    
    override func buildHierarchy() {
        addView(titleLabel, button)
    }
    
    override func buildConstraints() {
        titleLabel.layout.make { make in
            make.top.equalTo(layout.safeArea.top, constant: 20)
        }
        
        button.layout.make { make in
            make.top.equalTo(titleLabel.layout.top, constant: 20)
        }
    }
    
    override func render() {
        let background = UIImage(named: "LoginBackground_1")
        let imageView = UIImageView(frame: bounds)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = center
        
        self.addSubview(imageView)
        self.sendSubviewToBack(imageView)
    }
    
    override func buildAccessibility() {}
    override func updateAccessibility() {}
}

