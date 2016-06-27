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

	var request: Request?
	var user: User?

	override func viewDidLoad() {
		super.viewDidLoad()
		searchTextField.delegate = self
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

			self.user = User(data: response.data)
			print(self.user)

			if self.user != nil {
				self.performSegueWithIdentifier("showProfileSegue", sender: self)
			}

		}
		return true

	}

}
