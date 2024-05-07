//
//  ScannerPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 07/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit
import BarcodeScanner

class ScannerPresenter: NSObject, ScannerPresenterProtocol  {
    
    var interactor : ScannerInputInteractorProtocol?
    weak var view: ScannerViewProtocol?
    var wireframe: ScannerWireframeProtocol?
    
}

extension ScannerPresenter: ScannerOutputInteractorProtocol {
    
}

//MARK: Barcodescanner delegate
extension ScannerPresenter {
    func scanner(_ controller: BarcodeScanner.BarcodeScannerViewController, didCaptureCode code: String, type: String) {
        print("ovo je kod: ", code)
    }
    
    func scanner(_ controller: BarcodeScanner.BarcodeScannerViewController, didReceiveError error: any Error) {
    }
    
    func scannerDidDismiss(_ controller: BarcodeScanner.BarcodeScannerViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
    
}
