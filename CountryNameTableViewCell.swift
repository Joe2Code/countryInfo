//
//  CountryNameTableViewCell.swift
//  SimpleCountry
//
//  Created by Joseph Mennemeier on 6/1/16.
//  Copyright © 2016 Joseph Mennemeier. All rights reserved.
//

import UIKit

class CountryNameTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
