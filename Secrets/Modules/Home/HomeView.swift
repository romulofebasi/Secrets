//
//  HomeView.swift
//  Secrets
//
//  Created by Rômulo Lobo on 28/03/23.
//

import UIKit
import Constraints
import Components

internal protocol HomeViewDelegate: AnyObject {
    func onTapButton()
}

final class HomeView: View {
    weak var delegate: HomeViewDelegate?
    
    var viewModel: HomeViewModelProtocol? {
        didSet {
            update()
        }
    }
    
    let label: UILabel
    let button: Button
    
    override init() {
        self.label = UILabel()
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
        
        label.text = model.text
        button.text = "Componente Botão"
    }
    
    override func configure() {
        button.addTarget(self, action: #selector(onTapButton), for: .touchUpInside)
    }
    
    override func buildHierarchy() {
        addView(label, button)
    }
    
    override func buildConstraints() {
        label.layout.make { make in
            make.top.equalTo(layout.safeArea.top, constant: 20)
        }
        
        button.layout.make { make in
            make.top.equalTo(label.layout.top, constant: 20)
        }
    }
    
    override func render() {
        backgroundColor = .red
    }
    
    override func buildAccessibility() {}
    override func updateAccessibility() {}
}

extension HomeView {
    @objc
    private func onTapButton() {
        delegate?.onTapButton()
    }
}
