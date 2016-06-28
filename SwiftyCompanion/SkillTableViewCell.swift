//
//  SkillTableViewCell.swift
//  SwiftyCompanion
//
//  Created by Nicolas Chevalier on 28/06/16.
//  Copyright © 2016 Nicolas Chevalier. All rights reserved.
//

import UIKit

class SkillTableViewCell: UITableViewCell {

	@IBOutlet weak var skillNameLabel: UILabel!
	@IBOutlet weak var levelProgressView: UIProgressView!
	@IBOutlet weak var levelLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
