//
//  HomeView.swift
//  Secrets
//
//  Created by Rômulo Lobo on 28/03/23.
//

import UIKit

final class HomeView: View {
    var viewModel: HomeViewModelProtocol? {
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
    
    override func buildHierarchy() {}
    override func buildConstraints() {}
    override func render() {}
    
    override func buildAccessibility() {}
    override func updateAccessibility() {}
}
