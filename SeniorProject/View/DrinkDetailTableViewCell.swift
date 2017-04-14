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
    
    var valueLabel: Int = 1
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        NotificationCenter.default.addObserver(self, selector: #selector(DrinkDetailViewController.add(_:)), name: NSNotification.Name(rawValue: "changeLabel"), object: nil)
    }
    
//    func add(_ notification: Notification) {
//    }
    
    //MARK: - Action
    @IBAction func addDrinkToLabel(_ sender: UIButton) {
        labelIncre.text = "\(valueLabel)"
        valueLabel += 1
        NotificationCenter.default.post(name: Notification.Name(rawValue: "changeLabel"), object: nil, userInfo: nil)
    }
}
