//
//  NewLoyaltyCardPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 07/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class NewLoyaltyCardPresenter: NewLoyaltyCardPresenterProtocol  {
    
    var interactor : NewLoyaltyCardInputInteractorProtocol?
    weak var view: NewLoyaltyCardViewProtocol?
    var wireframe: NewLoyaltyCardWireframeProtocol?
    
    func camera(isFront: Bool){
        UIApplication.topViewController()?.openAlert(title: isFront ? LocalizedTitle.frontCardPage.localized : LocalizedTitle.backCardPage.localized, message: LocalizedTitle.photoOrAlbumDescription.localized, alertStyle: .actionSheet, actionTitles: [LocalizedTitle.takeAPhoto.localized, LocalizedTitle.photoAlbum.localized, LocalizedTitle.cancel.localized], actionColors: [.systemBlue, .systemBlue, .systemBlue], actionStyles: [.default, .default, .cancel], actions: [
            { [weak self] _ in
                guard let self = self  else {return}
            },
            { [weak self] _ in
                guard let self = self  else {return}
            },
            {_ in
                
            }
       ])
    }
}

extension NewLoyaltyCardPresenter: NewLoyaltyCardOutputInteractorProtocol {
    
}
