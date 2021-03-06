//
//  UserTipsCell.swift
//  finalproject
//
//  Created by Aynel Gül on 25-01-17.
//  Copyright © 2017 Aynel Gül. All rights reserved.
//

import UIKit

class UserTipsCell: UITableViewCell {
    
    // MARK: - Outlets.
    @IBOutlet weak var tipTitleLabel: UILabel!
    @IBOutlet weak var tipDescriptionLabel: UILabel!
    @IBOutlet weak var tipNameLabel: UILabel!
    @IBOutlet weak var tipImageView: UIImageView!
    
    // MARK: - Functions.
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
