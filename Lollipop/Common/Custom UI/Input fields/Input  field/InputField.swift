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
    
    open var placeholder: String? {
        set {
            let attributes = [
                NSAttributedString.Key.foregroundColor: AppColors.darkGrey,
                NSAttributedString.Key.font : UIFont.inter(ofSize: 14, name: .regular)
            ]
            self.textField.attributedPlaceholder = NSAttributedString(string: newValue ?? "", attributes:attributes)
        }
        get { return self.textField.placeholder }
    }
    
    open var error: String? {
        set { self.inputErrorLabel.text = newValue ?? "" }
        get { return "" }
    }
    
    open var text: String? {
        set 
            {   self.textField.text = newValue ?? ""
                self.textFieldPlaceholder.layer.borderColor = (newValue ?? "").isEmpty ? AppColors.mediumGrey.cgColor : AppColors.black.cgColor
            }
        get { return textField.text }
    }
    
    open var errorHidden: Bool? {
        set { self.inputErrorLabel.isHidden = newValue ?? false }
        get { return true }
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
    
    open var leftSuplementaryIcon: UIImage? {
        set { self.inputFieldSuplementaryLeftIcon.image = newValue ?? UIImage() }
        get { return UIImage() }
    }
    
    open var leftSuplementaryIconHidden: Bool? {
        set { self.inputFieldSuplementaryLeftIcon.isHidden = newValue ?? false }
        get { return true }
    }
    
    open var isSecureTextEntry: Bool? {
        set { self.textField.isSecureTextEntry = newValue ?? false }
        get { return !self.textField.isSecureTextEntry }
    }
    
    open var leftSuplementaryIconTint: UIColor? {
        set { self.inputFieldSuplementaryLeftIcon.tintColor = newValue ?? .clear }
        get { return .black }
    }
    
    open var leftLabelSupplementaryText: String? {
        set { self.inputFieldSuplementaryLeftLabel.text = newValue ?? "" }
        get { return "" }
    }
    
    open var leftSuplementarylabelHidden: Bool? {
        set { self.inputFieldSuplementaryLeftLabel.isHidden = newValue ?? false }
        get { return true }
    }
    
    open var leftSuplementaryLabelTextColor: UIColor? {
        set { self.inputFieldSuplementaryLeftLabel.textColor = newValue ?? AppColors.darkGrey }
        get { return AppColors.darkGrey }
    }
    
    open var rightSuplementaryIcon: UIImage? {
        set { self.inputFieldSuplementaryRightIcon.image = newValue ?? UIImage() }
        get { return UIImage() }
    }
    
    open var rightSuplementaryIconTintColor: UIColor? {
        set { self.inputFieldSuplementaryRightIcon.tintColor = newValue ?? AppColors.mediumGrey }
        get { return AppColors.mediumGrey }
    }
    
    open var rightSuplementaryIconHidden: Bool? {
        set { self.inputFieldSuplementaryRightView.isHidden = newValue ?? false }
        get { return true }
    }
    
    open var borderColor: UIColor? {
        set { self.textFieldPlaceholder.layer.borderColor = newValue?.cgColor ?? AppColors.mediumGrey.cgColor }
        get { return AppColors.mediumGrey }
    }
    
    open var borderWidth: CGFloat? {
        set { self.textFieldPlaceholder.layer.borderWidth = newValue ?? 1.0 }
        get { return 1.0 }
    }
    
    open var delegate: InputFieldProtocol?
    //MARK: Outlets
    
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
    
    lazy var inputFieldSuplementaryLeftIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.snp.makeConstraints { make in
            make.width.height.equalTo(24)
        }
        return imageView
    }()
    
    lazy var inputFieldSuplementaryRightIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var inputFieldSuplementaryRightButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(onSuplementaryButtonTap), for: .touchUpInside)
        return button
    }()
    
    lazy var inputFieldSuplementaryRightView: UIView = {
        let view = UIView()
        view.addSubview(inputFieldSuplementaryRightIcon)
        inputFieldSuplementaryRightIcon.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
        view.addSubview(inputFieldSuplementaryRightButton)
        inputFieldSuplementaryRightButton.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
        return view
    }()
    
    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.font = .inter(ofSize: 14, name: .light)
        textField.textColor = AppColors.black
        return textField
    }()
    
    lazy var inputFieldSuplementaryLeftLabel: UILabel = {
        let label = UILabel()
        label.font = .inter(ofSize: 14, name: .regular)
        label.textColor = AppColors.darkGrey
        label.textAlignment = .left
        label.snp.makeConstraints { make in
            make.height.equalTo(14)
        }
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return label
    }()
    
    lazy var textFieldStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [inputFieldSuplementaryLeftLabel ,inputFieldSuplementaryLeftIcon, textField, inputFieldSuplementaryRightView])
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.alignment = .center
        stack.spacing = 8
        return stack
    }()
    
    lazy var textFieldPlaceholder: UIView = {
        let view = UIView()
        view.addSubview(textFieldStack)
        textFieldStack.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(12)
            make.trailing.equalToSuperview().offset(-12)
            make.top.equalToSuperview().offset(14)
            make.bottom.equalToSuperview().offset(-14)
        }
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        view.layer.borderWidth = 1
        view.layer.borderColor = AppColors.mediumGrey.cgColor
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
        self.textField.delegate = self
    }
    
    //MARK: Actions
    
    @objc func onSuplementaryButtonTap() {
        delegate?.showHidePassword(tag: self.tag)
    }
    
}

extension InputField : UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.textFieldPlaceholder.layer.borderWidth = 2
        self.textFieldPlaceholder.layer.borderColor = AppColors.link.cgColor
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.textFieldPlaceholder.layer.borderWidth = 1
        self.textFieldPlaceholder.layer.borderColor = (textField.text ?? "").isEmpty ? AppColors.mediumGrey.cgColor : AppColors.black.cgColor 
    }
}
