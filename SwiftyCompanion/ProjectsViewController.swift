//
//  ProjectsViewController.swift
//  SwiftyCompanion
//
//  Created by Nicolas Chevalier on 29/06/16.
//  Copyright © 2016 Nicolas Chevalier. All rights reserved.
//

import UIKit

class ProjectsViewController: UIViewController {

	@IBOutlet weak var tableView: UITableView!

	var user: User!

	override func viewDidLoad() {

		super.viewDidLoad()

		tabBarController?.title = "Projects"


		tableView.delegate = self
		tableView.dataSource = self

		let nib = UINib(nibName: "ProjectTableViewCell", bundle: nil)
		tableView.registerNib(nib, forCellReuseIdentifier: "projectCell")

	}

}

// MARK: - UITableView
extension ProjectsViewController: UITableViewDelegate, UITableViewDataSource {

	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		return user.projectsUsers.count

	}

	func tableView(tableView: UITableView,
	               cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

		let project = self.user.projectsUsers[indexPath.row]
		// swiftlint:disable force_cast
		let cell = tableView.dequeueReusableCellWithIdentifier("projectCell") as! ProjectTableViewCell
		// swiftlint:enable force_cast

		cell.nameLabel.text = project.project.name
		cell.statusLabel.text = project.status
		if let finalMark = project.finalMark {
			cell.finalMarkLabel.text = "\(finalMark)"
		} else {
			cell.finalMarkLabel.text = ""
		}

		switch project.validated {
		case .Some(true):
			cell.statusImageView.image = UIImage(named: "Ok")
			break
		case .Some(false):
			cell.statusImageView.image = UIImage(named: "Fail")
			break
		default:
			cell.statusImageView.image = UIImage(named: "Searching Group")
			break
		}

		return cell

	}

}
