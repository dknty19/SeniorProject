//
//  OrderHistoryTableViewCell.swift
//  SeniorProject
//
//  Created by Vinh (Vern) H. NGUYEN on 4/24/17.
//  Copyright © 2017 Vinh (Vern) H. NGUYEN. All rights reserved.
//

import UIKit

class OrderHistoryTableViewCell: UITableViewCell {

    @IBOutlet var nameTextField:UITextField!
    @IBOutlet var totalPriceTextField:UITextField!
    @IBOutlet var idBillTextField:UITextField!
    @IBOutlet var checkOutImageView:UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
