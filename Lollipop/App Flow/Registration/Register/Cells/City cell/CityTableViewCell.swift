//
//  CityTableViewCell.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 22.5.24..
//

import UIKit

class CityTableViewCell: DropDownCell {

    @IBOutlet weak var cityNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
