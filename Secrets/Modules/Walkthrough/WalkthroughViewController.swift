//
//  WalkthroughViewController.swift
//  Secrets
//
//  Created by Romulo Lobo Fernandes Barros da Silva on 06/08/23.
//

import Foundation
import UIKit
import Constraints
import Components

final class WalkthroughViewController: PageViewController {
    let pages: [WalkthroughPageViewController] = [
        WalkthroughPageViewController(page: .one),
        WalkthroughPageViewController(page: .two),
        WalkthroughPageViewController(page: .three)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Theme.color.background
        setupPageController()
        setupBlurredView()
        setupPages()
    }
}

extension WalkthroughViewController {
    private func setupPageController() {
        dataSource = self
        view.subviews.compactMap({ $0 as? UIScrollView }).first!.bounces = false
        didMove(toParent: self)
    }
    
    private func setupBlurredView() {
        let walkthroughView = WalkthroughView(view: view)
        walkthroughView.frame = view.bounds
        view.addSubview(walkthroughView)
        view.sendSubviewToBack(walkthroughView)
    }
    
    private func setupPages() {
        for page in pages {
            page.delegate = self
        }
        
        setViewControllers([pages[0]], direction: .forward, animated: true)
    }
}

extension WalkthroughViewController: WalkthroughPageViewDelegate {
    func onTapContinueButton(_ pageNumber: Int) {
        if pageNumber >= pages.count - 1 {
            return
        }
        
        setViewControllers([pages[pageNumber + 1]], direction: .forward, animated: true)
    }
}

extension WalkthroughViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return nil
    }
}
