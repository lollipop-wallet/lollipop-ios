//
//  AddCardComponent.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 2.5.24..
//

import UIKit

class AddCardComponent: UIView {
    
    lazy var dataContentView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    lazy var topPaddingView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.white
        return view
    }()
    
    lazy var bottomView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.white
        view.layer.cornerRadius = 32
        view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        view.layer.shadowColor =  UIColor(red: 0.118, green: 0.118, blue: 0.118, alpha: 0.1).cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = CGSize(width: 0, height: 8)
        view.layer.shadowRadius = 34
        return view
    }()
    
    lazy var shadowPlaceholderView: UIView = {
        let view = UIView()
        view.addSubview(topPaddingView)
        topPaddingView.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.height.equalTo(74)
        }
        view.addSubview(bottomView)
        bottomView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(topPaddingView.snp.bottom)
        }
        
        view.addSubview(dataContentView)
        dataContentView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(32)
            make.bottom.equalToSuperview().offset(-32)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(200)
        }
//        view.addSubview(dataPlaceholderView)
//        dataPlaceholderView.snp.makeConstraints { make in
//            make.leading.trailing.top.bottom.equalToSuperview()
//        }

        return view
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
        self.addSubview(shadowPlaceholderView)
        shadowPlaceholderView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
    }
}
