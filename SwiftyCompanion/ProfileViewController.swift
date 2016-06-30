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
	@IBOutlet weak var skillsTableView: UITableView!

	var user: User!

	override func viewDidLoad() {

		super.viewDidLoad()

		skillsTableView.dataSource = self
		skillsTableView.delegate = self

		let nib = UINib(nibName: "SkillTableViewCell", bundle: nil)
		skillsTableView.registerNib(nib, forCellReuseIdentifier: "skillCell")

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
		if let phone = user.phone {
			self.phoneLabel.text = "Phone: \(phone)"
		} else {
			self.phoneLabel.hidden = true
		}
		if let cursus = user.cursusUsers?[0] {
			self.levelLabel.text = "Level: \(cursus.level)"
		} else {
			self.levelLabel.hidden = true
		}
		self.correctionPointLabel.text = "Correction Points: \(user.correctionPoint)"
		self.walletLabel.text = "Wallet: \(user.wallet)"

	}

	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
		tabBarController?.title = "Profile"

	}

}

// MARK: - UITableView
extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {

	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return (self.user.cursusUsers?[0].skills?.count) ?? 0
	}

	func tableView(tableView: UITableView,
	               cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

		if let skill = self.user.cursusUsers?[0].skills?[indexPath.row] {
		// swiftlint:disable force_cast
		let cell = tableView.dequeueReusableCellWithIdentifier("skillCell") as! SkillTableViewCell
		// swiftlint:enable force_cast
		cell.skillNameLabel.text = skill.name
		cell.levelProgressView.progress = modf(skill.level).1
		cell.levelLabel.text = "\(skill.level)"

		return cell
		} else {
			return UITableViewCell()
		}

	}

}
