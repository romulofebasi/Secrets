//
//  WalkthroughView.swift
//  Secrets
//
//  Created by Romulo Lobo Fernandes Barros da Silva on 06/08/23.
//

import UIKit
import Constraints
import Components

final class WalkthroughView: View {
    
    var viewModel: WalkthroughViewModelProtocol
    var shapes: [CAShapeLayer]
    let blurView: UIVisualEffectView
    
    init(view: UIView) {
        self.viewModel = WalkthroughViewModel(view: view)
        self.shapes = []
        self.blurView = UIVisualEffectView()
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configure() {
        
    }
    
    override func buildHierarchy() {
        shapes.append(createShapeLayer(.red, for: 0))
        shapes.append(createShapeLayer(.green, for: 1))
        shapes.append(createShapeLayer(.blue, for: 2))
        
        addView(blurView)
    }
    
    override func buildConstraints() {
        blurView.layout.make { make in
            make.top.equalTo(layout.top)
            make.left.equalTo(layout.left)
            make.right.equalTo(layout.right)
            make.bottom.equalTo(layout.bottom)
        }
    }
    
    override func render() {
        backgroundColor = .clear
        
        blurView.effect = UIBlurEffect(style: UIBlurEffect.Style.systemChromeMaterial)
        blurView.frame = bounds
        blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    override func buildAccessibility() {}
    override func updateAccessibility() {}
}

extension WalkthroughView {
    public func onChangePage() {
        //animatePath()
    }
    
    private func createShapeAnimation(_ shape: CAShapeLayer, for index: Int) {
        let animation = CABasicAnimation(keyPath: "path")
        animation.autoreverses = true
        animation.duration = 7
        animation.repeatCount = .infinity
        animation.toValue = viewModel.paths[index].next.path.cgPath
        animation.fillMode = .forwards
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        animation.isRemovedOnCompletion = false
        shape.add(animation, forKey: nil)
    }
    
    private func createShapeLayer(_ color: UIColor, for index: Int) -> CAShapeLayer {
        let shape = CAShapeLayer()
        shape.path = viewModel.paths[index].path.cgPath
        shape.fillColor = color.cgColor
        shape.opacity = 0.90
        shape.lineCap = .round
        shape.lineWidth = 20.0
        layer.addSublayer(shape)
        createShapeAnimation(shape, for: index)
        return shape
    }
}
