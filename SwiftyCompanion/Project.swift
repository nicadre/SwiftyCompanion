//
//  Project.swift
//  SwiftyCompanion
//
//  Created by Nicolas Chevalier on 25/06/16.
//  Copyright © 2016 Nicolas Chevalier. All rights reserved.
//

import Foundation
import SwiftyJSON

class Project {

	let identifier: Int
	let name: String
	let slug: String

	init?(json: JSON) {

		guard let
			identifier = json["id"].int,
			name = json["name"].string,
			slug = json["slug"].string
			else {
				return nil
		}

		self.identifier = identifier
		self.name = name
		self.slug = slug

	}

}
