//
//  ProfileViewController.swift
//  SwiftyCompanion
//
//  Created by Nicolas Chevalier on 27/06/16.
//  Copyright © 2016 Nicolas Chevalier. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

	@IBOutlet weak var scrollView: UIScrollView!
	@IBOutlet weak var profileImage: UIImageView!

	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var loginLabel: UILabel!
	@IBOutlet weak var phoneLabel: UILabel!
	@IBOutlet weak var levelLabel: UILabel!

	var user: User!

	override func viewDidLoad() {

		super.viewDidLoad()

		tabBarController?.title = "Profile"

		self.scrollView.showsHorizontalScrollIndicator = false
		let bounds = scrollView.bounds
		self.scrollView.contentSize = CGSize(width: bounds.width, height: bounds.height)
		self.scrollView.frame = CGRect(x: bounds.origin.x,
		                               y: bounds.origin.y,
		                               width: bounds.width,
		                               height: bounds.height)


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
		self.loginLabel.text = user.login
		self.phoneLabel.text = user.phone
		self.levelLabel.text = "\(user.cursusUsers[0].level)"

	}

	func scrollViewDidScroll(scrollView: UIScrollView) {
		self.scrollView.contentOffset.x = 0
	}

}
