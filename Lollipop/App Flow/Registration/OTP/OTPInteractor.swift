//
//  OTPInteractor.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 25.4.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class OTPInteractor: OTPInputInteractorProtocol {

    weak var presenter: OTPOutputInteractorProtocol?
    
    func viewDidLoad() {
        let id = OTPWireframe.id ?? 0
        let email = OTPWireframe.email ?? ""
        let otpType = OTPWireframe.otpType
        let delegate = OTPWireframe.delegate
        presenter?.takeData(id: id, email: email, otpType: otpType, delegate: delegate)
    }
    
    func verify(id: Int, code: String) {
    }
}
