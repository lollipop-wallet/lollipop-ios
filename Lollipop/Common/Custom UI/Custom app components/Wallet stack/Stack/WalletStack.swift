//
//  WalletStack.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 4.5.24..
//

import UIKit

class WalletStack: UIView {
    
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

        let colors = [UIColor.red, UIColor.blue, UIColor.darkGray, UIColor.yellow, UIColor.green]
        
        for i in 0..<5 {
            let view = WalletCard()
            view.background = colors[i]
            self.addSubview(view)
            view.snp.makeConstraints { make in
                make.leading.trailing.equalToSuperview()
                make.height.equalTo(view.snp.width).multipliedBy(0.645)
                make.top.equalToSuperview().offset(i == 0 ? 0 : (i * 86))
            }
        }
    }
}
