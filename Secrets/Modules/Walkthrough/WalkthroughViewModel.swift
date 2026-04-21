//
//  WalkthroughViewModel.swift
//  Secrets
//
//  Created by Romulo Lobo Fernandes Barros da Silva on 06/08/23.
//

import Foundation
import UIKit
import Constraints

internal protocol WalkthroughViewModelProtocol: ViewModel {
    var paths: [WalkthroughBackgroundAnimationPath] { get }
}

internal struct WalkthroughViewModel: WalkthroughViewModelProtocol {
    let paths: [WalkthroughBackgroundAnimationPath]
    
    init(view: UIView) {
        self.paths = [
            .bottomRight(view: view),
            .bottomCenter(view: view),
            .bottomRightUp(view: view)
        ]
    }
}

internal enum WalkthroughBackgroundAnimationPath {
    case center(view: UIView)
    case bottomCenter(view: UIView)
    case bottomRight(view: UIView)
    case bottomRightUp(view: UIView)
    
    var path: UIBezierPath {
        switch self {
        case .center(_):
            return bezierPath(radius: 120)
        case .bottomCenter(_):
            return bezierPath(radius: 120)
        case .bottomRight(_):
            return bezierPath(radius: 120)
        case .bottomRightUp(_):
            return bezierPath(radius: 120)
        }
    }
    
    var next: WalkthroughBackgroundAnimationPath {
        switch self {
        case .center(let view):
            return .bottomRight(view: view)
        case .bottomCenter(let view):
            return .center(view: view)
        case .bottomRight(let view):
            return .bottomRightUp(view: view)
        case .bottomRightUp(let view):
            return .bottomRight(view: view)
        }
    }
    
    private var point: (x: CGFloat, y: CGFloat) {
        switch self {
        case .center(let view):
            return (x: view.frame.size.width / 2, y: view.frame.size.height / 2)
        case .bottomCenter(let view):
            return (x: view.frame.size.width / 2, y: view.frame.size.height * 0.85)
        case .bottomRight(let view):
            return (x: view.frame.size.width * 0.9, y: view.frame.size.height * 0.85)
        case .bottomRightUp(let view):
            return (x: view.frame.size.width * 0.9, y: view.frame.size.height * 0.75)
        }
    }
    
    private func bezierPath(radius: CGFloat) -> UIBezierPath {
        let startPoint = CGFloat(-Double.pi / 2)
        let endPoint = CGFloat(3 * Double.pi / 2)
        let centerPoint = CGPoint(x: point.x, y: point.y)
        
        return UIBezierPath(arcCenter: centerPoint, radius: radius, startAngle: startPoint, endAngle: endPoint, clockwise: true)
    }
}

internal enum WalkthroughPage: Int {
    case one = 0
    case two = 1
    case three = 2
    
    var model: WalkthroughPageViewModelProtocol {
        switch self {
        case .one:
            return WalkthroughPageViewModel(number: self.rawValue, image: UIImage(resource: R.image.loginBackground_1)!, title: "One", message: "OneM", button: "OneB")
        case .two:
            return WalkthroughPageViewModel(number: self.rawValue, image: UIImage(resource: R.image.loginBackground_1)!, title: "Two", message: "TwoM", button: "TwoB")
        case .three:
            return WalkthroughPageViewModel(number: self.rawValue, image: UIImage(resource: R.image.loginBackground_1)!, title: "Three", message: "ThreeM", button: "ThreeB")
        }
    }
}
