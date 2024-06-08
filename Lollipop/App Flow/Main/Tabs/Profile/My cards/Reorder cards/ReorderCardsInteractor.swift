//
//  ReorderCardsInteractor.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 01/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class ReorderCardsInteractor: ReorderCardsInputInteractorProtocol {
    
    weak var presenter: ReorderCardsOutputInteractorProtocol?
    
    func viewDidLoad() {
        let cards = ReorderCardsWireframe.cards ?? []
        let delegate = ReorderCardsWireframe.delegate
        presenter?.takeData(cards: cards, delegate: delegate)
    }
    
    func reorder(parameters: String) {
        let postData = parameters.data(using: .utf8)
//
        var request = URLRequest(url: URL(string: Configuration.productionServerBaseURL + "cards/positions")!,timeoutInterval: Double.infinity)
        request.addValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        request.addValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        request.addValue("Bearer \(Manager.token)", forHTTPHeaderField: HTTPHeaderField.authorization.rawValue)

        request.httpMethod = "POST"
        request.httpBody = postData
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            guard let self = self else {return}
            guard let data = data else {
                Alert().alertMessageNoNavigator(title: LocalizedTitle.warning.localized, text: error?.localizedDescription ?? "", shouldDismiss: false)
                return
            }
            let decoder = JSONDecoder()
            if let model = try? decoder.decode(ReorderCardsModel.self, from: data) {
                self.presenter?.parseReorderCardsData(model: model)
            }
        }
        
        task.resume()
    }
}
