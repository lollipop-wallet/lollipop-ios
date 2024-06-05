//
//  PromotionDetailsPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 3.5.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit
import SafariServices
import WebKit

class PromotionDetailsPresenter: NSObject, PromotionDetailsPresenterProtocol  {
    
    var interactor : PromotionDetailsInputInteractorProtocol?
    weak var view: PromotionDetailsViewProtocol?
    var wireframe: PromotionDetailsWireframeProtocol?
    
    var banner: Banner?
    
    func viewDidLoad() {
        interactor?.viewDidLoad()
    }
    
    func seeMore() {
        wireframe?.openExternalLinkWith(link: self.banner?.external_link ?? "", delegate: self)
    }
}

extension PromotionDetailsPresenter: PromotionDetailsOutputInteractorProtocol {
    func takeDataWith(banner: Banner?){
        self.banner = banner
        self.view?.setTitleWith(title: banner?.title ?? "")
        self.view?.setContentWith(content: (banner?.description ?? ""))
    }
}

//MARK: SafariController delegate
extension PromotionDetailsPresenter {
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true)
    }
}

extension PromotionDetailsPresenter {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        let js = "document.getElementsByTagName('body')[0].style.webkitTextSizeAdjust='300%'"//dual size
        webView.evaluateJavaScript(js, completionHandler: nil)
    }
}
