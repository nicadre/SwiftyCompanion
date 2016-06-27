//
//  APIManager.swift
//  SwiftyCompanion
//
//  Created by Nicolas Chevalier on 22/06/16.
//  Copyright © 2016 Nicolas Chevalier. All rights reserved.
//

import Alamofire
import UIKit
import p2_OAuth2

public class APIManager {

	private let viewController: UIViewController!
	private let requester = APIRequester.sharedInstance

	init(view: UIViewController) {

		self.viewController = view

	}

	public func authorize() {

		if requester.oauth2.hasUnexpiredAccessToken() == false {
			let vc = try? requester.oauth2.authorizeSafariEmbeddedFrom(viewController)
			requester.oauth2.afterAuthorizeOrFailure = { _, _ in

				vc?.dismissViewControllerAnimated(true, completion: nil)

			}
		} else {
			requester.oauth2.authorize()
		}
	}

	public func request(method: Alamofire.Method,
	                    _ URLString: URLStringConvertible,
						parameters: [String : AnyObject]? = nil,
						encoding: ParameterEncoding = .URL,
						headers: [String : String]? = nil,
						completionHandler: (Response<AnyObject, NSError>) -> ()) {

		self.requester.oauth2.onAuthorize = { _ in

			self.requester.oauth2.request(method,
				URLString,
				parameters: parameters,
				encoding: encoding,
				headers: headers)
				.validate()
				.responseJSON(completionHandler: { (response) in

					print(self.requester.oauth2.accessToken)
				dispatch_async(dispatch_get_main_queue()) {

					completionHandler(response)

				}

			})

		}

		self.authorize()

	}

}
