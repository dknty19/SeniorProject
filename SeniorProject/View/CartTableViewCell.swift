//
//  CartTableViewCell.swift
//  SeniorProject
//
//  Created by Vinh (Vern) H. NGUYEN on 4/18/17.
//  Copyright © 2017 Vinh (Vern) H. NGUYEN. All rights reserved.
//

import UIKit

class CartTableViewCell: UITableViewCell {
    
    @IBOutlet var nameItemLabel:UILabel!
    @IBOutlet var quantityItemLabel:UILabel!
    @IBOutlet var totalPriceLabel:UILabel!
    @IBOutlet var photoImageView:UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
