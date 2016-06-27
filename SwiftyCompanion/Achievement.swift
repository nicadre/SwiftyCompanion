//
//  Achievement.swift
//  SwiftyCompanion
//
//  Created by Nicolas Chevalier on 26/06/16.
//  Copyright © 2016 Nicolas Chevalier. All rights reserved.
//

import Foundation
import SwiftyJSON

class Achievement {

	let identifier: Int
	let name: String
	let description: String
	let tier: String
	let kind: String
	let visible: Bool
	let image: String
	let numberOfSucces: Int?
	let usersURL: String

	init?(json: JSON) {

		guard let
			identifier = json["id"].int,
			name = json["name"].string,
			description = json["description"].string,
			tier = json["tier"].string,
			kind = json["kind"].string,
			visible = json["visible"].bool,
			image = json["image"].string,
			usersURL = json["users_url"].string
			else {
				return nil
		}

		self.identifier = identifier
		self.name = name
		self.description = description
		self.tier = tier
		self.kind = kind
		self.visible = visible
		self.image = image
		self.numberOfSucces = json["nbr_of_success"].int
		self.usersURL = usersURL

	}

}
