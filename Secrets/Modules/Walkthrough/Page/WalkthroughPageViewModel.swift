//
//  WalkthroughPageViewModel.swift
//  Secrets
//
//  Created by Romulo Lobo Fernandes Barros da Silva on 12/08/23.
//

import Foundation
import UIKit
import Constraints

internal protocol WalkthroughPageViewModelProtocol: ViewModel {
    var number: Int { get }
    var image: UIImage { get }
    var title: String { get }
    var message: String { get }
    var button: String { get }
}

internal struct WalkthroughPageViewModel: WalkthroughPageViewModelProtocol {
    let number: Int
    let image: UIImage
    let title: String
    let message: String
    let button: String
}
