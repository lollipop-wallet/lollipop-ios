
//
//  OnboardingView.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 22/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//
import UIKit

class OnboardingView: UIViewController, OnboardingViewProtocol {

    var pageViewController: UIPageViewController!

    var presenter: OnboardingPresenterProtocol?

	override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        presenter?.viewDidLoad()
    }
    
    //MARK: OnboardingView Protocol
    
    func setPageViewControllerWith(vc: UIViewController){
        DispatchQueue.main.async {
            self.pageViewController.setViewControllers([vc], direction: UIPageViewController.NavigationDirection.forward, animated: true, completion: nil)
            self.pageViewController.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
            self.addChild(self.pageViewController)
            self.view.addSubview(self.pageViewController.view)
            self.pageViewController.didMove(toParent: self)
        }
    }
    
    func setNextViewControllerWith(vc: UIViewController, isForward: Bool){
        DispatchQueue.main.async {
            self.pageViewController.setViewControllers([vc], direction: isForward ? UIPageViewController.NavigationDirection.forward : UIPageViewController.NavigationDirection.reverse, animated: true, completion: nil)
        }
    }

}
