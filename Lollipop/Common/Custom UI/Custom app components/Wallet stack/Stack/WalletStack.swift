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
        let view1 = UIView()
        let view2 = UIView()
        let view3 = UIView()
        let view4 = UIView()
        let view5 = UIView()
        
        view1.backgroundColor = .red
        view2.backgroundColor = .yellow
        view3.backgroundColor = .orange
        view4.backgroundColor = .blue
        view5.backgroundColor = .darkGray
        
        let views = [view1, view2, view3, view4, view5]
        
        for i in 0..<views.count {
            let view = views[i]
            self.addSubview(view)
            view.snp.makeConstraints { make in
                make.leading.trailing.equalToSuperview()
                make.height.equalTo(view.snp.width).multipliedBy(0.645)
                make.top.equalToSuperview().offset(i == 0 ? 0 : (i * 86))
            }
        }
    }
}
