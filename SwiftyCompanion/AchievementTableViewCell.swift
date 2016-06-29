//
//  AchievementTableViewCell.swift
//  SwiftyCompanion
//
//  Created by Nicolas Chevalier on 29/06/16.
//  Copyright © 2016 Nicolas Chevalier. All rights reserved.
//

import UIKit

class AchievementTableViewCell: UITableViewCell {

	@IBOutlet weak var achievementImage: UIImageView!
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var descriptionLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
