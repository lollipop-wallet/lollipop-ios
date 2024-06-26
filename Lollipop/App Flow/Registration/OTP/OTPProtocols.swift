//
//  OTPProtocols.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 25.4.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import Alamofire

//MARK: Presenter
// VIEW TO PRESENTER
protocol OTPPresenterProtocol: OTPInputFieldProtocol {
    
    var interactor: OTPInputInteractorProtocol? { get set }
    var view: OTPViewProtocol? { get set }
    var wireframe:OTPWireframeProtocol? { get set }
    
    func viewDidLoad()
    func proceed(firstChar: String, secondChar: String, thirdChar: String, fourthChar: String)
    func requestNewCode()
}
//MARK: Interactor
//PRESENTER TO INTERACTOR
protocol OTPInputInteractorProtocol: AnyObject {
    
    var presenter: OTPOutputInteractorProtocol?  { get set }
    func viewDidLoad()
    func verify(id: Int, code: String)
    func resendRegistrationOTP()
    func resendForgotPasswordOTPWith(email: String)
}
//MARK: Interactor
//INTERACTOR TO PRESENTER
protocol OTPOutputInteractorProtocol: AnyObject {
    func takeData(id: Int, email: String, otpType: OTPType?, delegate: OTPControllerProtocol?)
    func parseVerificationData(result: Result<Empty, AFError>)
    func parseOTPData(result: Result<OTPModel, AFError>)
}
//MARK: View
protocol OTPViewProtocol: AnyObject {
    var presenter: OTPPresenterProtocol?  { get set }
    func setSubtitleWith(subtitle: NSAttributedString)
    func activateFirstField()
    func activateSecondField()
    func activateThirdField()
    func activateFourthField()
    func resignFirstResponder()
    func validate(firstFieldEmpty: Bool, secondFieldEmpty: Bool, thirdFieldEmpty: Bool, fourthFieldEmpty: Bool)
    func setBackButtonToLeftBarButtonItems(shouldSet: Bool)
    func setTimerLabelHidden(isHidden: Bool)
    func setSendNewCodeButtonHidden(isHidden: Bool)
    func setTimerLabelTextWith(text: NSAttributedString)
}
//MARK: Wireframe
protocol OTPWireframeProtocol: AnyObject {
    static var id: Int? { get set }
    static var email: String? { get set }
    static var otpType: OTPType? { get set }
    static var delegate: OTPControllerProtocol? { get set }
    func toMain()
    func toNewPasswordWith(email: String, otp: String)
}

//MARK: OTPController protocol
protocol OTPControllerProtocol: AnyObject {
    func dismissAndPop()
}
