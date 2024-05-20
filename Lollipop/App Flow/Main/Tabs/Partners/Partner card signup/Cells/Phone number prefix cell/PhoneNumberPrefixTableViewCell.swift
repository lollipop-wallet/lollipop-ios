//
//  PhoneNumberPrefixTableViewCell.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 16/05/2024.
//

import UIKit
//import DropDown

class PhoneNumberPrefixTableViewCell: DropDownCell {

    @IBOutlet weak var countryFlagImageView: UIImageView!
    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var countryCodeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        countryFlagImageView.layer.cornerRadius = 12
        countryFlagImageView.layer.masksToBounds = true
        countryFlagImageView.image = UIImage(named: AssetTitles.flagMneIcon)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
