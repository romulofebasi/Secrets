//
//  LoginView.swift
//  Secrets
//
//  Created by Rômulo Lobo on 28/03/23.
//

import UIKit
import Constraints
import Components

internal protocol LoginViewDelegate: AnyObject {
    func onTapButton()
}

final class LoginView: View {
    weak var delegate: LoginViewDelegate?
    
    var viewModel: LoginViewModelProtocol? {
        didSet {
            update()
        }
    }
    
    let titleLabel: UILabel
    let continueButton: Button
    
    override init() {
        self.titleLabel = UILabel()
        self.continueButton = Button(type: .secondary)
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
        continueButton.text = model.continueButtonText
    }
    
    override func configure() {
        continueButton.addTarget(self, action: #selector(onTapButton), for: .touchUpInside)
    }
    
    override func buildHierarchy() {
        addView(titleLabel, continueButton)
    }
    
    override func buildConstraints() {
        titleLabel.layout.make { make in
            make.top.equalTo(layout.safeArea.top, constant: 20)
        }
        
        continueButton.layout.make { make in
            make.left.equalTo(layout.left, constant: Theme.spacing.l)
            make.right.equalTo(layout.right, constant: -Theme.spacing.l)
            make.bottom.equalTo(layout.safeArea.bottom, constant: -Theme.spacing.m)
        }
    }
    
    override func render() {
        backgroundColor = Theme.color.background
        
        continueButton.titleLabel?.font = R.font.nunitoSans12ptExtraLight(size: Theme.size.xl)
    }
    
    override func buildAccessibility() {}
    override func updateAccessibility() {}
}

extension LoginView {
    
    @objc
    private func onTapButton() {
        delegate?.onTapButton()
    }
    
}
