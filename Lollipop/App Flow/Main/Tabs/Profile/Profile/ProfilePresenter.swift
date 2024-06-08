//
//  ProfilePresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 26/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit
import Alamofire
import Photos
import PhotosUI
import SafariServices


class ProfilePresenter: NSObject, ProfilePresenterProtocol  {
    
    var interactor : ProfileInputInteractorProtocol?
    weak var view: ProfileViewProtocol?
    var wireframe: ProfileWireframeProtocol?
    var delegate: ProfileControllerProtocol?
    
    let datasource = DefaultModels().profileDatasource
    var config = PHPickerConfiguration(photoLibrary: .shared())
    var userImage = UIImage()
    var model: ProfileModel?

    func myShops(){
        wireframe?.toMyShops()
    }
    
    func viewDidLoad() {
        PersonalDataWireframe.delegate = self
        interactor?.viewDidLoad()
        print("Aco")
    }
    
    func editAvatar(){
        config.selectionLimit = 1
        config.filter = PHPickerFilter.images
        UIApplication.topViewController()?.openAlert(title: LocalizedTitle.photoOrAlbumDescription.localized, message: "", alertStyle: .actionSheet, actionTitles: [LocalizedTitle.takeAPhoto.localized, LocalizedTitle.photoAlbum.localized, LocalizedTitle.cancel.localized], actionColors: [.systemBlue, .systemBlue, .systemBlue], actionStyles: [.default, .default, .cancel], actions: [
            { [weak self] _ in
                guard let self = self  else {return}
                if UIImagePickerController.isSourceTypeAvailable(.camera) {
                    let imagePicker = UIImagePickerController()
                    imagePicker.delegate = self
                    imagePicker.sourceType = .camera;
                    imagePicker.allowsEditing = false
                    UIApplication.topViewController()?.present(imagePicker, animated: true, completion: nil)
                }
            },
            { [weak self] _ in
                guard let self = self  else {return}
                let pickerViewController = PHPickerViewController(configuration: self.config)
                pickerViewController.delegate = self
                pickerViewController.modalPresentationStyle = .fullScreen
                UIApplication.topViewController()?.present(pickerViewController, animated: true, completion: nil)
            },
            {_ in
            }
       ])
    }
    
    func terms(){
        wireframe?.openLink(link: Configuration.terms, delegate: self)
    }
    
    func privacy(){
        wireframe?.openLink(link: Configuration.privacyPolicy, delegate: self)
    }
}

extension ProfilePresenter: ProfileOutputInteractorProtocol {
    func parseUserData(result: Result<ProfileModel, AFError>, delegate: ProfileControllerProtocol?){
        self.delegate = delegate
        switch result {
        case .success(let model):
            self.model = model
            self.view?.setUserNameWith(name: model.name ?? "")
            if !(model.avatar ?? "").isEmpty{
                self.view?.setUserAvatarWith(avatar: model.avatar ?? "")
            }
            self.view?.setUserPhoneWith(phone: model.phone ?? "")
            self.view?.setPhoneHidden(isHidden: (model.phone ?? "").isEmpty)
        case .failure(let error):
            Alert().alertMessageNoNavigator(title: LocalizedTitle.warning.localized, text: error.localizedDescription, shouldDismiss: false)
        }
    }
    
    func parseUpdatedAvatarData(result: Result<UpdateAvatarModel, AFError>){
        switch result {
        case .success(let model):
            self.view?.setUserAvatarWith(avatar: model.data?.avatar ?? "")
            self.delegate?.updateAvatar(avatar: model.data?.avatar ?? "")
        case .failure(let error):
            Alert().alertMessageNoNavigator(title: LocalizedTitle.warning.localized, text: error.localizedDescription, shouldDismiss: false)
        }
    }
    
    func parseSignOutData(result: Result<Empty, AFError>){
        switch result {
        case .success(_):
            Manager.token = ""
            Manager.isRegistered = false
            UserDefaults.standard.removeObject(forKey: StorageKeys.accessToken.rawValue)
            UserDefaults.standard.synchronize()
            wireframe?.toMain()
        case .failure(let error):
            Alert().alertMessageNoNavigator(title: LocalizedTitle.warning.localized, text: error.localizedDescription, shouldDismiss: false)
        }
    }
}

//MARK: UITableViewDelegate&Datasource
extension ProfilePresenter {
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.datasource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellId.profileCell.rawValue, for: indexPath) as! ProfileTableViewCell
        cell.configureWith(item: self.datasource[indexPath.section][indexPath.row], index: indexPath, delegate: self)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = AppColors.lightGrey
        return view
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 0 : 32
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
         return CGFloat.leastNonzeroMagnitude
    }
    
    func didSelectItemAt(index: IndexPath) {
        let item = self.datasource[index.section][index.row]
        switch item.item {
        case .settings:
            wireframe?.toPersonalData(model: self.model)
        case .cards:
            wireframe?.toMyCards(delegage: self)
        case .about:
            wireframe?.toAbout()
        case .terms:
            wireframe?.toTerms()
        case .shops:
            wireframe?.toMyShops()
        case .signout:
            interactor?.signOut()
        }
    }
}

//MARK: PHPickerController Delegate & ImagePicker delegate
extension ProfilePresenter {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true, completion: nil)
        
        let imageItems = results.map { $0.itemProvider }.filter { $0.canLoadObject(ofClass: UIImage.self) }
        
        let dispatchGroup = DispatchGroup()
        var images = [UIImage]()
        
        for imageItem in imageItems {
            dispatchGroup.enter() // signal IN
            imageItem.loadObject(ofClass: UIImage.self) { image, _ in
                if let image = image as? UIImage {
                    images.append(image)
                }
                dispatchGroup.leave() // signal OUT
            }
        }
        // This is called at the end; after all signals are matched (IN/OUT)
        dispatchGroup.notify(queue: .main) {
            if !images.isEmpty{
                self.userImage = images.first ?? UIImage()
                let imageData = self.userImage.jpegData(compressionQuality: 0.6)
                self.interactor?.updateAvatar(avatar: imageData ?? Data())
            }
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        guard let image = info[.originalImage] as? UIImage else {
            return
        }
        self.userImage = image
        let imageData = self.userImage.jpegData(compressionQuality: 0.4)
        self.interactor?.updateAvatar(avatar: imageData ?? Data())
    }
}

extension ProfilePresenter {
    func didUpdateProfileWith(model: ProfileModel?) {
        self.model = model
        self.view?.setUserNameWith(name: model?.name ?? "")
        self.view?.setUserPhoneWith(phone: model?.phone ?? "")
        self.view?.setPhoneHidden(isHidden: (model?.phone ?? "").isEmpty)
        self.delegate?.updateAvatar(avatar: model?.avatar ?? "")
        self.delegate?.updateNameWith(name: model?.name ?? "")
    }
}


//MARK: MyCardsCOntroller delegate
extension ProfilePresenter {
    func updateUserCardsWith(cards: [Card]) {
        self.delegate?.updateCardsWith(cards: cards)
    }
}
