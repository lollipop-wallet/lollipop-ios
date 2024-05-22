//
//  GenderTableViewCell.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 22.5.24..
//

import UIKit

class GenderTableViewCell: DropDownCell {

    @IBOutlet weak var genderLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
