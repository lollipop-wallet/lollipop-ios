
//
//  PromotionDetailsView.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 3.5.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//
import UIKit
import WebKit

class PromotionDetailsView: UIViewController, PromotionDetailsViewProtocol {
    
    var webView = WKWebView()
    var titleLabel = UILabel()
    
    var presenter: PromotionDetailsPresenterProtocol?
    
	override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        presenter?.viewDidLoad()
    }
    
    //MARK: PromotionDetailsView Protocol
    func setTitleWith(title: String){
        DispatchQueue.main.async {
            self.titleLabel.text = title
        }
    }
    
    func setContentWith(content: String){
        DispatchQueue.main.async {
            self.webView.loadHTMLString(content, baseURL: nil)
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
