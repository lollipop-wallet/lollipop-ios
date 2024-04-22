//
//  OnboardingProtocols.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 22/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

//MARK: Presenter
// VIEW TO PRESENTER
protocol OnboardingPresenterProtocol: AnyObject {
    
    var interactor: OnboardingInputInteractorProtocol? { get set }
    var view: OnboardingViewProtocol? { get set }
    var wireframe:OnboardingWireframeProtocol? { get set }
    
}
//MARK: Interactor
//PRESENTER TO INTERACTOR
protocol OnboardingInputInteractorProtocol: AnyObject {
    
    var presenter: OnboardingOutputInteractorProtocol?  { get set }
    
   
}
//MARK: Interactor
//INTERACTOR TO PRESENTER
protocol OnboardingOutputInteractorProtocol: AnyObject {
    

}
//MARK: View
protocol OnboardingViewProtocol: AnyObject {
    
    var presenter: OnboardingPresenterProtocol?  { get set }
    
}
//MARK: Wireframe
protocol OnboardingWireframeProtocol: AnyObject {

    
}

//MARK: ContentView Protocol
protocol ContentViewProtocol: AnyObject {
    func nextPage()
    func proceed()
}
