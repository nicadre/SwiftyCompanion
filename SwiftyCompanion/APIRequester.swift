//
//  APIRequester.swift
//  SwiftyCompanion
//
//  Created by Nicolas Chevalier on 22/06/16.
//  Copyright © 2016 Nicolas Chevalier. All rights reserved.
//

import Alamofire
import p2_OAuth2

public class APIRequester {

	static let sharedInstance: APIRequester = APIRequester()

	let oauth2: OAuth2CodeGrant

	private init() {

		let settings = [
			"client_id"		: "6a5e63ccdda44712bdcf368b0eb297ab1e1ca8fdcf75699a9f4711514faf54a1",
			"client_secret"	: "c810a89689885a4d43b0cfc06b0fabf6b804e8eb4c453f166882068a2edd15f7",
			"authorize_uri"	: "https://api.intra.42.fr/v2/oauth/authorize",
			"token_uri"		: "https://api.intra.42.fr/oauth/token",
			"scope"			: "public",
			"redirect_uris"	: ["com.niccheva.swiftycompanion://oauth-callback"],
			"keychain"		: true
		] as OAuth2JSON

		oauth2 = OAuth2CodeGrant(settings: settings)

	}

}
