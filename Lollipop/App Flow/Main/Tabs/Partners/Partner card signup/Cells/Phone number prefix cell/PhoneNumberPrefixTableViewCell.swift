//
//  PhoneNumberPrefixTableViewCell.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 16/05/2024.
//

import UIKit
//import DropDown

class PhoneNumberPrefixTableViewCell: DropDownCell {

    @IBOutlet weak var phonePrefixLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
