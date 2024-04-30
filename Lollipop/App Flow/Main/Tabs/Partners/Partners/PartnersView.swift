
//
//  PartnersView.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 26/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//
import UIKit

class PartnersView: UIViewController, PartnersViewProtocol {
    
    var mainStackView = UIStackView()
    var collectionView: AutomaticHeightCollectionView?

    var presenter: PartnersPresenterProtocol?

	override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    //MARK: Actions
    @objc func segmentAction(_ segmentedControl: UISegmentedControl) {
        //presenter?.onSegmentTapWith(segmentId: segmentedControl.selectedSegmentIndex)
    }
    
    @objc func onRecommendPartnerTap() {
        //presenter?.suggestPartner()
        let vc = DialogueView()
        DialogueWireframe.icon = AssetTitles.illustrationSuccessIcon
        DialogueWireframe.title = LocalizedTitle.thanksForSuggestionTitle.localized
        DialogueWireframe.subtitle = LocalizedTitle.thanksForSuggestionSubtitle.localized
        DialogueWireframe.type = .dismissive
        UIApplication.topViewController()?.navigationController?.pushViewController(vc, animated: true)
    }
}
