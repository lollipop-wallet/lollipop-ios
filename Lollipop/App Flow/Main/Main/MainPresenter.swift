//
//  MainPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 26/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit
import Alamofire

class MainPresenter: NSObject, MainPresenterProtocol  {
    
    var interactor : MainInputInteractorProtocol?
    weak var view: MainViewProtocol?
    var wireframe: MainWireframeProtocol?
    
    
    func viewDidLoad(){
        let vc1 = HomeView()
        HomeWireframe.delegate = self
        vc1.tabBarItem = UITabBarItem(title: LocalizedTitle.home.localized, image: UIImage(named: AssetTitles.homeUnselectedIcon), selectedImage: UIImage(named: AssetTitles.homeSelectedIcon))
        vc1.navigationController?.title = LocalizedTitle.home.localized
        let vc1Nav = UINavigationController(rootViewController: vc1)
        vc1Nav.isNavigationBarHidden = false
        
        let vc2 = PartnersView()
        PartnersWireframe.delegate = self
        vc2.tabBarItem = UITabBarItem(title: LocalizedTitle.stores.localized, image: UIImage(named: AssetTitles.partnersUnselectedIcon), selectedImage: UIImage(named: AssetTitles.partnersSelectedIcon))
        vc2.navigationController?.title = LocalizedTitle.stores.localized
        let vc2Nav = UINavigationController(rootViewController: vc2)
        vc2Nav.isNavigationBarHidden = false
        
        let vc3 = UIViewController()
        vc3.tabBarItem = UITabBarItem(title: "", image: nil, selectedImage: nil)
        let vc3Nav = UINavigationController(rootViewController: vc3)
        vc3Nav.isNavigationBarHidden = true
        
        let vc4 = LollipopView()
        vc4.tabBarItem = UITabBarItem(title: LocalizedTitle.lollipop.localized, image: UIImage(named: AssetTitles.lollipopUnselectedIcon), selectedImage: UIImage(named: AssetTitles.lollipopSelectedIcon))
        vc4.navigationController?.title = LocalizedTitle.lollipop.localized
        let vc4Nav = UINavigationController(rootViewController: vc4)
        vc4Nav.isNavigationBarHidden = false
        
        let vc5 = ProfileView()
        vc5.tabBarItem = UITabBarItem(title: LocalizedTitle.profile.localized, image: UIImage(named: AssetTitles.profileUnselectedIcon), selectedImage: UIImage(named: AssetTitles.profileSelectedIcon))
        vc5.navigationController?.title = LocalizedTitle.profile.localized
        let vc5Nav = UINavigationController(rootViewController: vc5)
        vc5Nav.isNavigationBarHidden = false
        
        let vc6 = SignInView()
        vc6.tabBarItem = UITabBarItem(title: LocalizedTitle.profile.localized, image: UIImage(named: AssetTitles.profileUnselectedIcon), selectedImage: UIImage(named: AssetTitles.profileSelectedIcon))
        vc5.navigationController?.title = LocalizedTitle.profile.localized
        let vc6Nav = UINavigationController(rootViewController: vc6)
        vc5Nav.isNavigationBarHidden = false
        
        view?.setControllersWith(vcs: [vc1Nav, vc2Nav, vc3Nav, vc4Nav, Manager.isRegistered ? vc5Nav : vc6Nav])
    }

    func scanCard(){
        if Manager.isRegistered {
            wireframe?.toCardTemplates()
        }else{
            view?.switchTabWith(index: .profile)
        }
    }
}

extension MainPresenter: MainOutputInteractorProtocol {
}

//MARK: HomeController Delegate
extension MainPresenter {
    func toPartnersTabFromHome() {
        view?.switchTabWith(index: .partners)
    }
    
    func toProfileTabFromHome() {
        view?.switchTabWith(index: .profile)
    }
}

//MARK: PartnersController Delegate
extension MainPresenter {
    func toProfileTab() {
        view?.switchTabWith(index: .profile)
    }
}
