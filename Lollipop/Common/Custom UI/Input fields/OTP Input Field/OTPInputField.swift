//
//  OTPInputField.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 25/04/2024.
//

import UIKit

class OTPInputField: UIView {
    
    //MARK: Properties
    
    open var text: String? {
        set { self.textField.text = newValue ?? "" }
        get { return textField.text }
    }
    
    open var background: UIColor? {
        set { self.textFieldPlaceholder.backgroundColor = newValue ?? .clear }
        get { return .white }
    }
    
    open var font: UIFont? {
        set { self.textField.font = newValue ?? .inter(ofSize: 14, name: .light)}
        get { return .inter(ofSize: 14, name: .light) }
    }
    
    open var keyboardType: UIKeyboardType? {
        set { self.textField.keyboardType = newValue ?? .default }
        get { return .default }
    }
    
    open var borderColor: UIColor? {
        set { self.textFieldPlaceholder.layer.borderColor = newValue?.cgColor ?? AppColors.mediumGrey.cgColor }
        get { return AppColors.mediumGrey }
    }
    
    open var borderWidth: CGFloat? {
        set { self.textFieldPlaceholder.layer.borderWidth = newValue ?? 1.0 }
        get { return 1.0 }
    }
    
    var fieldTag = Int()
    
    var delegate: OTPInputFieldProtocol?
    
    //MARK: Outlets
    
    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.font = .inter(ofSize: 28, name: .medium)
        textField.textColor = AppColors.black
        textField.textAlignment = .center
        return textField
    }()
    
    lazy var textFieldPlaceholder: UIView = {
        let view = UIView()
        view.addSubview(textField)
        textField.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(12)
            make.trailing.equalToSuperview().offset(-12)
            make.top.equalToSuperview().offset(14)
            make.bottom.equalToSuperview().offset(-14)
        }
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        view.layer.borderWidth = 1
        view.layer.borderColor = AppColors.mediumGrey.cgColor
        return view
    }()
    
    lazy var inputStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [textFieldPlaceholder])
        stack.axis = .vertical
        stack.distribution = .fill
        stack.alignment = .fill
        stack.spacing = 8
        return stack
    }()
    
    required init() {
        super.init(frame: .zero)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
    }
    
    
    func setup() {
        self.addSubview(inputStackView)
        inputStackView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
        self.textField.delegate = self
    }
    
    //MARK: Actions
    
}

extension OTPInputField : UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.textFieldPlaceholder.layer.borderWidth = 2
        self.textFieldPlaceholder.layer.borderColor = AppColors.link.cgColor
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.textFieldPlaceholder.layer.borderWidth = 1
        self.textFieldPlaceholder.layer.borderColor = (textField.text ?? "").isEmpty ? AppColors.mediumGrey.cgColor : AppColors.black.cgColor
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if (string.count == 1){
            delegate?.becomeFirstResponder(tag: self.fieldTag)
            textField.text? = string
            return false
        }else{
            delegate?.becomeFirstResponder(tag: self.fieldTag)
            textField.text? = string
            return false
        }
    }
}
