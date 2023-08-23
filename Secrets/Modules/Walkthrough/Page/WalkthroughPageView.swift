//
//  WalkthroughPageView.swift
//  Secrets
//
//  Created by Romulo Lobo Fernandes Barros da Silva on 06/08/23.
//

import UIKit
import Constraints
import Components

protocol WalkthroughPageViewDelegate: AnyObject {
    func onTapContinueButton(_ pageNumber: Int)
}

final class WalkthroughPageView: View {
    weak var delegate: WalkthroughPageViewDelegate?
    
    var viewModel: WalkthroughPageViewModelProtocol? {
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
        guard let model = viewModel else { return }
        titleLabel.text = model.title
        continueButton.text = model.button
    }
    
    override func configure() {
        continueButton.addTarget(self, action: #selector(onTapContinueButton), for: .touchUpInside)
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
        backgroundColor = .clear // Theme.color.background
        
        continueButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
    }
    
    override func buildAccessibility() {}
    override func updateAccessibility() {}
}

extension WalkthroughPageView {
    @objc
    private func onTapContinueButton() {
        guard let model = viewModel else { return }
        delegate?.onTapContinueButton(model.number)
    }
}
