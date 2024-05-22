//
//  CalendarInputField.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 24.4.24..
//

import UIKit

class CalendarInputField: UIView {
    
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
        set { self.inputLabel.text = newValue ?? "" }
        get { return inputLabel.text }
    }
    
    open var errorHidden: Bool? {
        set { self.inputErrorLabel.isHidden = newValue ?? false }
        get { return true }
    }
    
    open var background: UIColor? {
        set { self.titleFieldPlaceholder.backgroundColor = newValue ?? .clear }
        get { return .white }
    }
    
    open var font: UIFont? {
        set { self.inputLabel.font = newValue ?? .inter(ofSize: 14, name: .light)}
        get { return .inter(ofSize: 14, name: .light) }
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
    
    open var textColor: UIColor? {
        set { self.inputLabel.textColor = newValue ?? AppColors.mediumGrey }
        get { return AppColors.mediumGrey }
    }
    
    open var borderColor: UIColor? {
        set { self.titleFieldPlaceholder.layer.borderColor = newValue?.cgColor ?? AppColors.mediumGrey.cgColor }
        get { return AppColors.mediumGrey }
    }
    
    open var borderWidth: CGFloat? {
        set { self.titleFieldPlaceholder.layer.borderWidth = newValue ?? 1.0 }
        get { return 1.0 }
    }
    
    open var delegate: CalendarInputProtocol?
    
    //MARK: Outlets
    
    lazy var inputLabel: UILabel = {
        let label = UILabel()
        label.font = .inter(ofSize: 14, name: .light)
        label.textColor = AppColors.darkGrey
        label.textAlignment = .left
        label.snp.makeConstraints { make in
            make.height.equalTo(20)
        }
        return label
    }()
    
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
    
    lazy var titleFieldStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [inputLabel, inputFieldSuplementaryRightView])
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.alignment = .center
        stack.spacing = 8
        return stack
    }()
    
    lazy var titleFieldPlaceholder: UIView = {
        let view = UIView()
        view.addSubview(titleFieldStack)
        titleFieldStack.snp.makeConstraints { make in
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
        let stack = UIStackView(arrangedSubviews: [inputTitleLabel, titleFieldPlaceholder, inputErrorLabel])
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
    
    @objc func onSuplementaryButtonTap() {
        //MARK: Delegat da se postavi date picker
        delegate?.showCalendar()
    }
}
