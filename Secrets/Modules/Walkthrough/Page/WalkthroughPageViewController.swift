//
//  WalkthroughPageViewController.swift
//  Secrets
//
//  Created by Romulo Lobo Fernandes Barros da Silva on 12/08/23.
//

import Foundation
import UIKit

final class WalkthroughPageViewController: UIViewController {
    var delegate: WalkthroughPageViewDelegate? {
        didSet {
            updateViewDelegate()
        }
    }
    
    public init(page: WalkthroughPage) {
        super.init(nibName: nil, bundle: nil)
        
        let view = WalkthroughPageView()
        view.viewModel = page.model
        self.view = view
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension WalkthroughPageViewController {
    private func updateViewDelegate() {
        guard let view = view as? WalkthroughPageView else { return }
        view.delegate = delegate
    }
}

