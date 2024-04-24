//
//  InputField.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 23/04/2024.
//

import UIKit

class InputField: UIView {
    
    //MARK: Properties
    
    open var title: String? {
        set { self.inputTitleLabel.text = newValue ?? "" }
        get { return "" }
    }
    
    open var error: String? {
        set { self.inputErrorLabel.text = newValue ?? "" }
        get { return "" }
    }
    
    open var text: String? {
        set { self.textField.text = newValue ?? "" }
        get { return textField.text }
    }
    
    open var errorHidden: Bool? {
        set { self.inputErrorLabel.isHidden = newValue ?? false }
        get { return true }
    }
    
    lazy var inputTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .inter(ofSize: 14, name: .light)
        label.textColor = AppColors.black
        label.textAlignment = .left
        label.snp.makeConstraints { make in
            make.height.equalTo(20)
        }
        return label
    }()
    
    lazy var inputErrorLabel: UILabel = {
        let label = UILabel()
        label.font = .inter(ofSize: 10, name: .light)
        label.textColor = AppColors.error
        label.textAlignment = .left
        label.snp.makeConstraints { make in
            make.height.equalTo(12)
        }
        return label
    }()
    
    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.font = .inter(ofSize: 14, name: .light)
        textField.textColor = AppColors.black
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
        view.layer.borderColor = AppColors.black.cgColor
        view.snp.makeConstraints { make in
            make.height.equalTo(48)
        }
        return view
    }()
    
    lazy var inputStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [inputTitleLabel, textFieldPlaceholder, inputErrorLabel])
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
        
    }
    
    //MARK: Actions
    
}

