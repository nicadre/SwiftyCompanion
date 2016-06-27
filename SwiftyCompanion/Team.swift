//
//  Team.swift
//  SwiftyCompanion
//
//  Created by Nicolas Chevalier on 27/06/16.
//  Copyright © 2016 Nicolas Chevalier. All rights reserved.
//

import Foundation
import SwiftyJSON

class Team {

	let identifier: Int
	let name: String
	let url: String
	let finalMark: Int?
	let projectId: Int
	let createdAt: String
	let updatedAt: String
	let status: String
	let usersId: [Int]
	let locked: Bool
	let validated: Bool?
	let closed: Bool
	let repoUrl: String?
	let repoUUID: String?
	let lockedAt: String?
	let closedAt: String?
	let projectSessionId: Int

	private class func getUsersId(json: JSON) -> [Int]? {

		var ary: [Int] = []
		var fail: Bool = false
		if let tab = json["users"].array {
			tab.forEach() { value in
				if let identifier = value["id"].int {
					ary.append(identifier)
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
			name = json["name"].string,
			url = json["url"].string,
			projectId = json["project_id"].int,
			createdAt = json["created_at"].string,
			updatedAt = json["updated_at"].string,
			status = json["status"].string,
			usersId = Team.getUsersId(json),
			locked = json["locked?"].bool,
			closed = json["closed?"].bool,
			projectSessionId = json["project_session_id"].int
			else {
				return nil
		}

		self.identifier = identifier
		self.name = name
		self.url = url
		self.finalMark = json["final_mark"].int
		self.projectId = projectId
		self.createdAt = createdAt
		self.updatedAt = updatedAt
		self.status = status
		self.usersId = usersId
		self.locked = locked
		self.validated = json["validated?"].bool
		self.closed = closed
		self.repoUrl = json["repo_url"].string
		self.repoUUID = json["repo_uuid"].string
		self.lockedAt = json["locked_at"].string
		self.closedAt = json["closed_at"].string
		self.projectSessionId = projectSessionId

	}

}
