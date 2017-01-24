//
//  TipsBuddiesCell.swift
//  finalproject
//
//  Created by Aynel Gül on 20-01-17.
//  Copyright © 2017 Aynel Gül. All rights reserved.
//

import UIKit

class TipsBuddiesCell: UITableViewCell {
    
    // MARK: Outlets.
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
