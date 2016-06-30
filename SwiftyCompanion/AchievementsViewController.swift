//
//  AchievementsViewController.swift
//  SwiftyCompanion
//
//  Created by Nicolas Chevalier on 29/06/16.
//  Copyright © 2016 Nicolas Chevalier. All rights reserved.
//

import UIKit

class AchievementsViewController: UIViewController {

	@IBOutlet weak var tableView: UITableView!

	var user: User!

	override func viewDidLoad() {

		super.viewDidLoad()

		tableView.delegate = self
		tableView.dataSource = self

		let nib = UINib(nibName: "AchievementTableViewCell", bundle: nil)
		tableView.registerNib(nib, forCellReuseIdentifier: "achievementCell")

	}

	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
		tabBarController?.title = "Achievements"

	}

}

// MARK: - UITableView
extension AchievementsViewController: UITableViewDataSource, UITableViewDelegate {

	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		return user.achievements.count

	}

	func tableView(tableView: UITableView,
	               cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

		let achievement = self.user.achievements[indexPath.row]
		// swiftlint:disable force_cast
		let cell = tableView.dequeueReusableCellWithIdentifier("achievementCell")
			as! AchievementTableViewCell
		// swiftlint:enable force_cast

//		if let url = NSURL(string: "https://cdn.intra.42.fr\(achievement.image.stringByReplacingOccurrencesOfString("/uploads", withString: ""))") {
//			if let data = NSData(contentsOfURL: url) {
//				cell.achievementImage.image = UIImage(data: data)
//			}
//		}

		cell.nameLabel.text = achievement.name
		cell.descriptionLabel.text = achievement.description

		return cell

	}

}
