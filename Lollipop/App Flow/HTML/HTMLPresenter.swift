//
//  HTMLPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 5.6.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit
import WebKit
import SafariServices

class HTMLPresenter: NSObject, HTMLPresenterProtocol  {
    
    var interactor : HTMLInputInteractorProtocol?
    weak var view: HTMLViewProtocol?
    var wireframe: HTMLWireframeProtocol?
    
    var title: String?
    var desc: String?
    var buttonTitle: String?
    var externalLink: String?
    
    func viewDidLoad() {
        interactor?.viewDidLoad()
    }
    
    func seeMore() {
        wireframe?.openExternalLinkWith(link: self.externalLink ?? "", delegate: self)
    }
}

extension HTMLPresenter: HTMLOutputInteractorProtocol {
    func takeData(title: String, description: String, buttonTitle: String, externalLink: String) {
        print("Link: ", externalLink)
        self.title = title
        self.desc = description
        self.buttonTitle = buttonTitle
        self.externalLink = externalLink
        self.view?.setTitleWith(title: title)
        self.view?.setContentWith(content: description)
        self.view?.setSeeMoreHidden(isHidden: externalLink.isEmpty)
        self.view?.setSeeMoreTitle(buttonTitle: buttonTitle)
    }
}

extension HTMLPresenter {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
//        let js = "document.getElementsByTagName('body')[0].style.webkitTextSizeAdjust='300%'"//dual size
//        webView.evaluateJavaScript(js, completionHandler: nil)
    }
}

//MARK: SafariController delegate
extension HTMLPresenter {
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true)
    }
}
