//
//  DrinkDetailTableViewCell.swift
//  Test
//
//  Created by Vinh (Vern) H. NGUYEN on 4/3/17.
//  Copyright (c) 2017 Vinh (Vern) H. NGUYEN. All rights reserved.
//

import UIKit

class DrinkDetailTableViewCell: UITableViewCell {
    
    @IBOutlet var descriptionTextField:UITextField!
    @IBOutlet var labelIncre:UILabel!
    @IBOutlet var labelPrice:UILabel!
    @IBOutlet var labelNameDrink:UILabel!
    
    var drinkCell:Drink!
    
    var valueLabel: Int = 1
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        NotificationCenter.default.addObserver(self, selector: #selector(DrinkDetailTableViewCell.add(_:)), name: NSNotification.Name(rawValue: "changeLabel"), object: nil)
    }
    
    func add(_ notification: Notification) {
//        labelNameDrink.text = drinkCell.name
    }
    
    //MARK: - Action
    
}
