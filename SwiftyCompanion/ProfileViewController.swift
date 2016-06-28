//
//  ProfileViewController.swift
//  SwiftyCompanion
//
//  Created by Nicolas Chevalier on 27/06/16.
//  Copyright © 2016 Nicolas Chevalier. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

	@IBOutlet weak var contentView: UIView!
	@IBOutlet weak var profileImage: UIImageView!

	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var loginLabel: UILabel!
	@IBOutlet weak var emailLabel: UILabel!
	@IBOutlet weak var phoneLabel: UILabel!
	@IBOutlet weak var levelLabel: UILabel!
	@IBOutlet weak var correctionPointLabel: UILabel!
	@IBOutlet weak var walletLabel: UILabel!

	var user: User!

	override func viewDidLoad() {

		super.viewDidLoad()

		tabBarController?.title = "Profile"

		self.profileImage.layer.borderWidth = 3
		self.profileImage.layer.masksToBounds = false
		self.profileImage.layer.borderColor = UIColor.whiteColor().CGColor
		self.profileImage.layer.cornerRadius = self.profileImage.frame.height / 2
		self.profileImage.clipsToBounds = true

		if let url = NSURL(string: user.imageUrl) {
			if let data = NSData(contentsOfURL: url) {
				self.profileImage.image = UIImage(data: data)
			}
		}

		self.nameLabel.text = user.displayName
		self.loginLabel.text = "Login: \(user.login)"
		self.emailLabel.text = "Email: \(user.email)"
		self.phoneLabel.text = "Phone: \(user.phone)"
		self.levelLabel.text = "Level: \(user.cursusUsers[0].level)"
		self.correctionPointLabel.text = "Correction Points: \(user.correctionPoint)"
		self.walletLabel.text = "Wallet: \(user.wallet)"

	}

}
