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
    var viewModel: WalkthroughPageViewModelProtocol? {
        didSet {
            update()
        }
    }
    
    let circles: CAShapeLayer
    let blurView: UIVisualEffectView
    
    override init() {
        self.circles = CAShapeLayer()
        self.blurView = UIVisualEffectView()
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func update() {
        guard let model = viewModel else { return }
    }
    
    override func configure() {
        circles.path = bezierPath(radius: 120).cgPath
        circles.fillColor = UIColor.red.cgColor
        circles.opacity = 1
        circles.lineCap = .round
        circles.lineWidth = 20.0
    }
    
    override func buildHierarchy() {
        layer.addSublayer(circles)
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
        blurView.effect = UIBlurEffect(style: UIBlurEffect.Style.light)
        blurView.frame = bounds
        blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    override func buildAccessibility() {}
    override func updateAccessibility() {}
}

extension WalkthroughView {
    public func onChangePage() {
        
    }
    
    private func bezierPath(radius: CGFloat) -> UIBezierPath {
        let startPoint = CGFloat(-Double.pi / 2)
        let endPoint = CGFloat(3 * Double.pi / 2)
        let centerPoint = CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0)
        
        return UIBezierPath(arcCenter: centerPoint, radius: radius, startAngle: startPoint, endAngle: endPoint, clockwise: true)
    }
}
