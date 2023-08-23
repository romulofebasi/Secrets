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
    var pages: [WalkthroughPageViewController] { get }
}

internal struct WalkthroughViewModel: WalkthroughViewModelProtocol {
    let pages: [WalkthroughPageViewController]

    init() {
        self.pages = [
            WalkthroughPageViewController(page: .one),
            WalkthroughPageViewController(page: .two),
            WalkthroughPageViewController(page: .three)
        ]
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
