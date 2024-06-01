//
//  WalletCardPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 4.5.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit
import RSBarcodes_Swift
import AVFoundation

class WalletCardPresenter: NSObject, WalletCardPresenterProtocol  {
    
    var interactor : WalletCardInputInteractorProtocol?
    weak var view: WalletCardViewProtocol?
    var wireframe: WalletCardWireframeProtocol?
    
    var card: Card?
    
    func viewDidLoad() {
        interactor?.viewDidLoad()
    }
    
    func locations() {
        wireframe?.toLocations()
    }
}

extension WalletCardPresenter: WalletCardOutputInteractorProtocol {
    func takeData(card: Card?){
        self.card = card
        self.view?.setTitleWith(title: card?.card_template?.name ?? "")
        self.view?.setCardImageWith(image: card?.card_template?.image_front ?? "")
        self.view?.setBarcodeNumberWith(barcode: card?.code ?? "")
        let barcode = RSUnifiedCodeGenerator.shared.generateCode(card?.code ?? "", machineReadableCodeObjectType: AVMetadataObject.ObjectType.code128.rawValue)
        self.view?.setBarcodeImageWith(image: barcode ?? UIImage())
    }
}

//MARK: UITableViewDelegate&Datasource
extension WalletCardPresenter {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellId.walletCardShopCell.rawValue, for: indexPath) as! WalletCardShopTableViewCell
        cell.configureWith(index: indexPath, delegate: self)
        return cell
    }
    
    func didSelectItemAt(index: IndexPath) {
        
    }
}



class BarcodeGenerator {
    enum Descriptor: String {
        case code128 = "CICode128BarcodeGenerator"
        case pdf417 = "CIPDF417BarcodeGenerator"
        case aztec = "CIAztecCodeGenerator"
        case qr = "CIQRCodeGenerator"
    }

    class func generate(from string: String,
                         descriptor: Descriptor,
                               size: CGSize) -> UIImage? {
        let filterName = descriptor.rawValue

        guard let data = string.data(using: .ascii),
            let filter = CIFilter(name: filterName) else {
                return nil
        }

        filter.setValue(data, forKey: "inputMessage")

        guard let image = filter.outputImage else {
            return nil
        }

        let imageSize = image.extent.size

        let transform = CGAffineTransform(scaleX: size.width / imageSize.width,
                                               y: size.height / imageSize.height)
        let scaledImage = image.transformed(by: transform)
        
        let context:CIContext = CIContext.init(options: nil)
        let cgImage:CGImage = context.createCGImage(scaledImage, from: scaledImage.extent)!
        let finalImage:UIImage = UIImage.init(cgImage: cgImage)

        return finalImage
    }
}
