//
//  InputTextViewField.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 29.4.24..
//

import UIKit

class InputTextViewField: UIView {
    
    //MARK: Properties
    
    open var title: String? {
        set { self.inputTitleLabel.text = newValue ?? "" }
        get { return "" }
    }
    
    open var placeholder: String? {
        set { self.placeholderLabel.text = newValue ?? "" }
        get { return self.placeholderLabel.text }
    }
    
    open var error: String? {
        set { self.inputErrorLabel.text = newValue ?? "" }
        get { return "" }
    }
    
    open var text: String? {
        set { self.textView.text = newValue ?? "" }
        get { return textView.text }
    }
    
    open var errorHidden: Bool? {
        set { self.inputErrorLabel.isHidden = newValue ?? false }
        get { return true }
    }
    
    open var background: UIColor? {
        set { self.textViewPlaceholder.backgroundColor = newValue ?? .clear }
        get { return .white }
    }
    
    open var font: UIFont? {
        set { self.textView.font = newValue ?? .inter(ofSize: 14, name: .light)}
        get { return .inter(ofSize: 14, name: .light) }
    }
    
    open var keyboardType: UIKeyboardType? {
        set { self.textView.keyboardType = newValue ?? .default }
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
    
    lazy var placeholderLabel: UILabel = {
        let label = UILabel()
        label.font = .inter(ofSize: 14, name: .regular)
        label.textColor = AppColors.darkGrey
        label.textAlignment = .left
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
    
    lazy var textView: UITextView = {
        let textView = UITextView()
        textView.font = .inter(ofSize: 14, name: .light)
        textView.textColor = AppColors.black
        textView.backgroundColor = AppColors.white
        return textView
    }()
    
    lazy var textViewdStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [inputFieldSuplementaryLeftIcon, textView])
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.alignment = .fill
        stack.spacing = 8
        return stack
    }()
    
    lazy var textViewPlaceholder: UIView = {
        let view = UIView()
        view.addSubview(textViewdStack)
        textViewdStack.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(12)
            make.trailing.equalToSuperview().offset(-12)
            make.top.equalToSuperview().offset(14)
            make.bottom.equalToSuperview().offset(-14)
        }
        view.addSubview(placeholderLabel)
        placeholderLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(12)
            make.trailing.equalToSuperview().offset(-12)
            make.top.equalToSuperview().offset(14)
            make.height.equalTo(20)
        }
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        view.layer.borderWidth = 1
        view.layer.borderColor = AppColors.mediumGrey.cgColor
        view.snp.makeConstraints { make in
            make.height.equalTo(124)
        }
        return view
    }()
    
    lazy var inputStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [inputTitleLabel, textViewPlaceholder, inputErrorLabel])
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
        self.textView.delegate = self
    }
    
    //MARK: Actions
    
}

extension InputTextViewField : UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        self.textViewPlaceholder.layer.borderWidth = 2
        self.textViewPlaceholder.layer.borderColor = AppColors.link.cgColor
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        self.textViewPlaceholder.layer.borderWidth = 1
        self.textViewPlaceholder.layer.borderColor = (textView.text ?? "").isEmpty ? AppColors.mediumGrey.cgColor : AppColors.black.cgColor
    }
    
    func textViewDidChange(_ textView: UITextView) {
        self.placeholderLabel.isHidden = !textView.text.isEmpty
    }
}
