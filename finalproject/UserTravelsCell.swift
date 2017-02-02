//
//  UserTravelsCell.swift
//  finalproject
//
//  Created by Aynel Gül on 20-01-17.
//  Copyright © 2017 Aynel Gül. All rights reserved.
//

import UIKit

class UserTravelsCell: UITableViewCell {
    
    // MARK: - Outlets.
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    // MARK: - Functions.
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
