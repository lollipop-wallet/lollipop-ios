//
//  OnboardingPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 22/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class OnboardingPresenter: NSObject, OnboardingPresenterProtocol  {
    
    var interactor : OnboardingInputInteractorProtocol?
    weak var view: OnboardingViewProtocol?
    var wireframe: OnboardingWireframeProtocol?
    
    var currentPageIndex: Int = 0
    
    func viewDidLoad(){
        let initialContenViewController = self.pageTutorialAtIndex(0) as ContentView
        view?.setPageViewControllerWith(vc: initialContenViewController)
    }
    
    fileprivate func pageTutorialAtIndex(_ index: Int) ->ContentView {
        let pageContentViewController = ContentView()
        pageContentViewController.pageIndex = index
        pageContentViewController.titleString = DefaultModels().onboardingDatasource[index].title
        pageContentViewController.subtitleString = DefaultModels().onboardingDatasource[index].subtitle
        pageContentViewController.artworkName = DefaultModels().onboardingDatasource[index].artwork
        pageContentViewController.delegate = self
        return pageContentViewController
    }
}

extension OnboardingPresenter: OnboardingOutputInteractorProtocol {
    
}


extension OnboardingPresenter {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController?{
        let viewController = viewController as! ContentView
        var index = viewController.pageIndex as Int
        
        if(index == 0 || index == NSNotFound){
            return nil
        }
        index -= 1
        return self.pageTutorialAtIndex(index)
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController?{
        let viewController = viewController as! ContentView
        var index = viewController.pageIndex as Int
        if(index == NSNotFound){
            return nil
        }
        index += 1
        if(index == DefaultModels().onboardingDatasource.count){
            return nil
        }
        return self.pageTutorialAtIndex(index)
    }
    func presentationCount(for pageViewController: UIPageViewController) -> Int{
        return DefaultModels().onboardingDatasource.count
    }
       
    func presentationIndex(for pageViewController: UIPageViewController) -> Int{
        return currentPageIndex
    }
}

extension OnboardingPresenter {
    func nextPage(page: Int){
        self.currentPageIndex = page
        let nextController = self.pageTutorialAtIndex(page) as ContentView
        self.view?.setNextViewControllerWith(vc: nextController, isForward: true)
    }
    
    func proceed(){
        wireframe?.toMain()
    }
}
