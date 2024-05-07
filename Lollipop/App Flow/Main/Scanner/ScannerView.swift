
//
//  ScannerView.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 07/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//
import UIKit
import BarcodeScanner

class ScannerView: UIViewController, ScannerViewProtocol {
    
    var scannerContainerView = UIView()
    let scanner = BarcodeScannerViewController()

    var presenter: ScannerPresenterProtocol?

	override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        self.addChild(scanner)
        scanner.view.frame = scannerContainerView.bounds
        scannerContainerView.addSubview(scanner.view)
        scanner.didMove(toParent: self)
    }

}
