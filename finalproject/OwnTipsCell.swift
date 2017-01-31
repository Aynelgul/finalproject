//
//  OwnTipsCell.swift
//  finalproject
//
//  Created by Aynel Gül on 30-01-17.
//  Copyright © 2017 Aynel Gül. All rights reserved.
//

import UIKit

class OwnTipsCell: UITableViewCell {
    
    // MARK: Outlets.
    
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
