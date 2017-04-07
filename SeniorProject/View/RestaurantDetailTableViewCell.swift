//
//  RestaurantDetailTableViewCell.swift
//  Test
//
//  Created by Vinh (Vern) H. NGUYEN on 3/21/17.
//  Copyright (c) 2017 Vinh (Vern) H. NGUYEN. All rights reserved.
//

import UIKit

class RestaurantDetailTableViewCell: UITableViewCell {

//    @IBOutlet var fieldLabel:UILabel!
//    @IBOutlet var valueLabel:UILabel!
    @IBOutlet var descriptionMainFood:UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
