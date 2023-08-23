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
    var currentPage: Int = 0
    
    var viewModel: WalkthroughViewModelProtocol? {
        didSet {
            update()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green // Theme.color.background
        setupPageController()
        setupBlurredView()
        viewModel = WalkthroughViewModel()
    }
}

extension WalkthroughViewController {
    private func setupPageController() {
        dataSource = self
        delegate = self
        view.subviews.compactMap({ $0 as? UIScrollView }).first!.bounces = false
        didMove(toParent: self)
    }
    
    private func setupBlurredView() {
        let walkthroughView = WalkthroughView()
        walkthroughView.frame = view.bounds
        view.addSubview(walkthroughView)
        view.sendSubviewToBack(walkthroughView)
    }
    
    private func update() {
        guard let model = viewModel else { return }
        
        for page in model.pages {
            page.delegate = self
        }
        
        setViewControllers([model.pages[0]], direction: .forward, animated: true)
    }
}

extension WalkthroughViewController: WalkthroughPageViewDelegate {
    func onTapContinueButton(_ pageNumber: Int) {
        guard let model = viewModel else { return }
        
        if pageNumber >= model.pages.count - 1 {
            return
        }
        
        setViewControllers([model.pages[pageNumber + 1]], direction: .forward, animated: true)
    }
}

extension WalkthroughViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return nil
        
        guard let model = viewModel else { return nil }
        guard let currentIndex = model.pages.firstIndex(of: viewController as! WalkthroughPageViewController) else { return nil }
                
        if currentIndex == 0 {
            currentPage = model.pages.count - 1
            let page = model.pages[currentPage]
            page.delegate = self
            return page
        } else {
            currentPage = currentIndex - 1
            let page = model.pages[currentPage]
            page.delegate = self
            return page
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return nil
        
        guard let model = viewModel else { return nil }
        guard let currentIndex = model.pages.firstIndex(of: viewController as! WalkthroughPageViewController) else { return nil }
        
        if currentIndex < model.pages.count - 1 {
            currentPage = currentIndex + 1
            let page = model.pages[currentPage]
            page.delegate = self
            return page
        } else {
            currentPage = 0
            let page = model.pages[currentPage]
            page.delegate = self
            return page
        }
    }
}

extension WalkthroughViewController: UIPageViewControllerDelegate {
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        guard let model = viewModel else { return 0 }
        return model.pages.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return currentPage
    }
}
