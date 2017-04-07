//
//  RestaurantTableViewCell.swift
//  Test
//
//  Created by Vinh (Vern) H. NGUYEN on 3/20/17.
//  Copyright (c) 2017 Vinh (Vern) H. NGUYEN. All rights reserved.
//

import UIKit

class DrinkTableViewCell: UITableViewCell {
    
    @IBOutlet var nameDrinkLabel:UILabel!
    @IBOutlet var typeDrinkLabel:UILabel!
    @IBOutlet var priceDrinkLabel:UILabel!
    @IBOutlet var drinkImageView:UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
