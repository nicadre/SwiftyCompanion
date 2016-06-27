//
//  Cursus.swift
//  SwiftyCompanion
//
//  Created by Nicolas Chevalier on 26/06/16.
//  Copyright © 2016 Nicolas Chevalier. All rights reserved.
//

import Foundation
import SwiftyJSON

class Cursus {

	let identifier: Int
	let createdAt: String
	let name: String
	let slug: String

	init?(json: JSON) {

		guard let
			identifier = json["id"].int,
			createdAt = json["created_at"].string,
			name = json["name"].string,
			slug = json["slug"].string
			else {
				return nil
		}

		self.identifier = identifier
		self.createdAt = createdAt
		self.name = name
		self.slug = slug

	}

}
