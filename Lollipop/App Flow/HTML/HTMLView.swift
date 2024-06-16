
//
//  HTMLView.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 5.6.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//
import UIKit
import WebKit

class HTMLView: UIViewController, HTMLViewProtocol {
    
    var webView = WKWebView()
    var titleLabel = UILabel()
    var seeMoreView = UIView()
    var seeMoreButton = UIButton()

	var presenter: HTMLPresenterProtocol?

	override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        presenter?.viewDidLoad()
    }
    
    //MARK: HTMLView protocol
    
    func setTitleWith(title: String){
        DispatchQueue.main.async {
            self.titleLabel.text = title
        }
    }
    
    func setContentWith(content: String){
        DispatchQueue.main.async {
            self.webView.loadHTMLString(content, baseURL: nil)
            self.webView.injectScript(fontFileName: "Inter-Bold", type: .ttf, fontFamilyName: "Inter")
        }
    }
    
    func setSeeMoreHidden(isHidden: Bool){
        DispatchQueue.main.async {
            self.seeMoreView.isHidden = isHidden
        }
    }
    func setSeeMoreTitle(buttonTitle: String) {
        DispatchQueue.main.async {
            self.seeMoreButton.setTitle(buttonTitle, for: .normal) 
        }
    }
    
    //MARK: Actions
    @objc func onBackTap() {
        popBack(2)
    }
    
    @objc func onSeeMoreTap() {
        presenter?.seeMore()
    }

}
