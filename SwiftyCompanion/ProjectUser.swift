//
//  ProjectUser.swift
//  SwiftyCompanion
//
//  Created by Nicolas Chevalier on 27/06/16.
//  Copyright © 2016 Nicolas Chevalier. All rights reserved.
//

import Foundation
import SwiftyJSON

class ProjectUser {

	let identifier: Int
	let occurrence: Int
	let finalMark: Int?
	let status: String
	let validated: Bool?
	let currentTeamId: Int?
	let project: Project

	init?(json: JSON) {

		guard let
			identifier = json["id"].int,
			occurrence = json["occurrence"].int,
			status = json["status"].string,
			project = Project(json: json["project"])
			else {
				print(json["id"].int)
				print(json["occurrence"].int)
				print(json["status"].string)
				print(json["current_team_id"].int)
				print(Project(json: json["project"]))
				return nil
		}

		self.identifier = identifier
		self.occurrence = occurrence
		self.finalMark = json["final_mark"].int
		self.status = status
		self.validated = json["validated?"].bool
		self.currentTeamId = json["current_team_id"].int
		self.project = project

	}

}
