//
//  SearchViewController.swift
//  SwiftyCompanion
//
//  Created by Nicolas Chevalier on 22/06/16.
//  Copyright © 2016 Nicolas Chevalier. All rights reserved.
//

import UIKit
import p2_OAuth2
import Alamofire

// MARK: - Main
class SearchViewController: UIViewController {

	@IBOutlet var searchTextField: UITextField!
	@IBOutlet weak var badLoginLabel: UILabel!

	var request: Request?
	var user: User?

	override func viewDidLoad() {
		super.viewDidLoad()
		searchTextField.delegate = self
		badLoginLabel.hidden = true
	}

	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)

		navigationController?.navigationBarHidden = true
	}

	override func viewWillDisappear(animated: Bool) {
		super.viewWillDisappear(animated)
		navigationController?.navigationBarHidden = false
	}

}

// MARK: - PrepareForSegue
extension SearchViewController {

	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

		if segue.identifier == "showProfileSegue" {
			if let tbc = segue.destinationViewController as? UITabBarController {
				if let vc = tbc.viewControllers![1] as? ProjectsViewController {
					vc.user = self.user
				}
				if let vc = tbc.viewControllers![2] as? AchievementsViewController {
					vc.user = self.user
				}
				if let dvc = tbc.viewControllers![0] as? ProfileViewController {
					dvc.user = self.user
				}
			}
		}

	}

}

// MARK: - UITextFieldDelegate
extension SearchViewController: UITextFieldDelegate {

	func textFieldShouldReturn(textField: UITextField) -> Bool {

		let manager = APIManager(view: self)

		manager.request(.GET, "https://api.intra.42.fr/v2/users/\(textField.text!)") { response in

			guard response.response?.statusCode >= 200 && response.response?.statusCode < 300 else {
				self.badLoginLabel.text = "Bad Login"
				self.badLoginLabel.hidden = false
				textField.enabled = true
				return
			}
			self.user = User(data: response.data)

			if self.user != nil {
				self.badLoginLabel.hidden = true
				textField.enabled = true
				self.performSegueWithIdentifier("showProfileSegue", sender: self)
			} else {
				self.badLoginLabel.text = "API changed..."
				self.badLoginLabel.hidden = false
				textField.enabled = true
			}

		}
		textField.enabled = false
		return true

	}

}
