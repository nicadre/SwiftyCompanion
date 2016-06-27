//
//  User.swift
//  SwiftyCompanion
//
//  Created by Nicolas Chevalier on 23/06/16.
//  Copyright © 2016 Nicolas Chevalier. All rights reserved.
//

import Foundation
import SwiftyJSON

class User {

	let identifier: Int
	let email: String
	let login: String
	let url: String // NSURL ?
	let phone: String
	let displayName: String
	let imageUrl: String // NSURL ?
	let staff: Bool
	let correctionPoint: Int
	let poolMonth: String // NSDate ?
	let poolYear: String // NSDate ?
	let location: String? // ???????
	let wallet: Int
	let projectsUsers: [ProjectUser]
	let cursusUsers: [CursusUser]
	let achievements: [Achievement]

	private class func getProjects(json: JSON) -> [ProjectUser]? {

		var ary: [ProjectUser] = []
		var fail: Bool = false
		if let tab = json["projects_users"].array {
			tab.forEach() { value in
				if let projectUser = ProjectUser(json: value) {
					ary.append(projectUser)
				} else {
					fail = true
				}
			}
			return fail ? nil : ary
		} else {
			return nil
		}

	}

	private class func getAchievements(json: JSON) -> [Achievement]? {

		var ary: [Achievement] = []
		var fail: Bool = false
		if let tab = json["achievements"].array {
			tab.forEach() { value in
				if let achievement = Achievement(json: value) {
					ary.append(achievement)
				} else {
					fail = true
				}
			}
			return fail ? nil : ary
		} else {
			return nil
		}

	}

	private class func getCursusUsers(json: JSON) -> [CursusUser]? {

		var ary: [CursusUser] = []
		var fail: Bool = false
		if let tab = json["cursus_users"].array {
			tab.forEach() { value in
				if let cursusUser = CursusUser(json: value) {
					ary.append(cursusUser)
				} else {
					fail = true
				}
			}
			return fail ? nil : ary
		} else {
			return nil
		}

	}

	init?(data: NSData?) {

		guard let data = data else {
			return nil
		}

		let json = JSON(data: data)

		guard let
			identifier = json["id"].int,
			email = json["email"].string,
			login = json["login"].string,
			url = json["url"].string,
			phone = json["phone"].string,
			displayName = json["displayname"].string,
			imageUrl = json["image_url"].string,
			staff = json["staff?"].bool,
			correctionPoint = json["correction_point"].int,
			poolMonth = json["pool_month"].string,
			poolYear = json["pool_year"].string,
			wallet = json["wallet"].int,
			projects = User.getProjects(json),
			cursusUsers = User.getCursusUsers(json),
			achievements = User.getAchievements(json)
			else {
				return nil
		}

		self.identifier = identifier
		self.email = email
		self.login = login
		self.url = url
		self.phone = phone
		self.displayName = displayName
		self.imageUrl = imageUrl
		self.staff = staff
		self.correctionPoint = correctionPoint
		self.poolMonth = poolMonth
		self.poolYear = poolYear
		self.location = json["location"].string
		self.wallet = wallet
		self.projectsUsers = projects
		self.cursusUsers = cursusUsers
		self.achievements = achievements

	}

}
