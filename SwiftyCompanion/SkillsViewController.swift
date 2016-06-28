//
//  SkillsViewController.swift
//  SwiftyCompanion
//
//  Created by Nicolas Chevalier on 28/06/16.
//  Copyright © 2016 Nicolas Chevalier. All rights reserved.
//

import UIKit
import SwiftyJSON

class SkillsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

	@IBOutlet weak var tableView: UITableView!
	var user: User!

	override func viewDidLoad() {

		super.viewDidLoad()

		let nib = UINib(nibName: "SkillTableViewCell", bundle: nil)
		tableView.registerNib(nib, forCellReuseIdentifier: "skillCell")

		tableView.dataSource = self
		tableView.delegate = self

	}

	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		return (self.user.cursusUsers[0].skills?.count)!

	}

	func tableView(tableView: UITableView,
	               cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

		let skill = self.user.cursusUsers[0].skills?[indexPath.row]
		// swiftlint:disable force_cast
		let cell = tableView.dequeueReusableCellWithIdentifier("skillCell") as! SkillTableViewCell
		// swiftlint:enable force_cast
		cell.skillNameLabel.text = skill!.name
		cell.levelProgressView.progress = modf(skill!.level).1
		cell.levelLabel.text = "\(skill!.level)"
		return cell

	}

}
