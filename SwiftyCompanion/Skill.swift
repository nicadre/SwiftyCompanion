//
//  Skill.swift
//  SwiftyCompanion
//
//  Created by Nicolas Chevalier on 26/06/16.
//  Copyright © 2016 Nicolas Chevalier. All rights reserved.
//

import Foundation
import SwiftyJSON

class Skill {

	let identifier: Int
	let name: String
	let level: Float

	init?(json: JSON) {

		guard let
			identifier = json["id"].int,
			name = json["name"].string,
			level = json["level"].float
			else {
			return nil
		}

		self.identifier = identifier
		self.name = name
		self.level = level

	}

}
