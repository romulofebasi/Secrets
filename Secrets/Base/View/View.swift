//
//  View.swift
//  Secrets
//
//  Created by Rômulo Lobo on 28/03/23.
//

import UIKit
import Constraints

internal protocol ViewProtocol: ViewCodable {
    func update()
    
    func buildHierarchy()
    func buildConstraints()
    func render()
    
    func buildAccessibility()
    func updateAccessibility()
}

class View: UIView, ViewProtocol {
    init() {
        super.init(frame: UIScreen.main.bounds)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update() {}
    
    func buildHierarchy() {}
    func buildConstraints() {}
    func render() {}
    
    func buildAccessibility() {}
    func updateAccessibility() {}
}
