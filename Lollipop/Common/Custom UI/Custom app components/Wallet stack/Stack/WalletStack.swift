//
//  WalletStack.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 4.5.24..
//

import UIKit

class WalletStack: UIView {
    
    var delegate: WalletStackProtocol?
    
    open var datasource: [Card]? {
        set { self.setup(cards: newValue ?? []) }
        get { return [] }
    }
    
    required init() {
        super.init(frame: .zero)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
    }
    
    func setup(cards: [Card]) {
        for i in 0..<cards.count{
            let card = cards[i]
            let view = WalletCard()
            view.delegate = self
            view.cardLogoIcon.imageFromURL(url: card.partner?.logo ?? "")
            view.cardImage.imageFromURL(url: card.card_template?.image_front ?? "")
            view.partnerName = card.partner?.name ?? ""
            view.tag = i
            self.addSubview(view)
            view.snp.makeConstraints { make in
                make.leading.trailing.equalToSuperview()
                make.height.equalTo(view.snp.width).multipliedBy(0.645)
                make.top.equalToSuperview().offset(i == 0 ? 0 : (i * 86))
                if i == cards.count - 1 {
                    make.bottom.equalToSuperview()
                }
            }
        }
    }
}

extension WalletStack: WalletCardProtocol {
    func didTapCardWith(tag: Int) {
        delegate?.didSelectLoyaltyCartAt(index: tag)
    }
}
