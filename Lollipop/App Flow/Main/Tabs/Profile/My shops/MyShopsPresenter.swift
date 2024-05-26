//
//  MyShopsPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 30/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class MyShopsPresenter: NSObject, MyShopsPresenterProtocol  {
    
    var interactor : MyShopsInputInteractorProtocol?
    weak var view: MyShopsViewProtocol?
    var wireframe: MyShopsWireframeProtocol?
    
    func viewDidLoad(){
        interactor?.viewDidLoad()
    }
}

extension MyShopsPresenter: MyShopsOutputInteractorProtocol {
    
}

//MARK: UITableViewDelegate&Datasource
extension MyShopsPresenter {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellId.myShopsCell.rawValue, for: indexPath) as! MyShopsTableViewCell
        cell.configureWith(index: indexPath, delegate: self)
        return cell
    }
    
    func didSelectItemAt(index: IndexPath) {
    }
}
