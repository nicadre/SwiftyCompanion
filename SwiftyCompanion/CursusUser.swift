//
//  CursusUser.swift
//  SwiftyCompanion
//
//  Created by Nicolas Chevalier on 26/06/16.
//  Copyright © 2016 Nicolas Chevalier. All rights reserved.
//

import Foundation
import SwiftyJSON

class CursusUser {

	let identifier: Int
	let endAt: String?
	let grade: String?
	let level: Float
	let skills: [Skill]?
	let cursusId: Int
	let userId: Int
	let cursus: Cursus

	private class func getSkills(json: JSON) -> [Skill]? {

		var ary: [Skill] = []
		var fail: Bool = false
		if let tab = json["skills"].array {
			tab.forEach() { value in
				if let skill = Skill(json: value) {
					ary.append(skill)
				} else {
					fail = true
				}
			}
			return fail ? nil : ary
		} else {
			return nil
		}

	}

	init?(json: JSON) {

		guard let
			identifier = json["id"].int,
			level = json["level"].float,
			cursusId = json["cursus_id"].int,
			userId = json["user"]["id"].int,
			cursus = Cursus(json: json["cursus"])
			else {
				return nil
		}

		self.identifier = identifier
		self.endAt = json["end_at"].string
		self.grade = json["grade"].string
		self.level = level
		self.skills = CursusUser.getSkills(json)
		self.cursusId = cursusId
		self.userId = userId
		self.cursus = cursus

	}

}
