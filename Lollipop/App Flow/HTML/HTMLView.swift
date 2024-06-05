
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

	var presenter: HTMLPresenterProtocol?

	override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    //MARK: Actions
    @objc func onBackTap() {
        popBack(2)
    }
    
    @objc func onSeeMoreTap() {
        presenter?.seeMore()
    }

}
