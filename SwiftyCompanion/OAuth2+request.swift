//
//  OAuth2+request.swift
//  SwiftyCompanion
//
//  Created by Nicolas Chevalier on 22/06/16.
//  Copyright © 2016 Nicolas Chevalier. All rights reserved.
//

import Alamofire
import p2_OAuth2

extension OAuth2 {

	public func request(method: Alamofire.Method,
	                    _ URLString: URLStringConvertible,
						parameters: [String : AnyObject]? = nil,
						encoding: ParameterEncoding = .URL,
						headers: [String : String]? = nil) -> Request {

		var hdrs = headers ?? [:]
		if let token = accessToken {
			hdrs["Authorization"] = "Bearer \(token)"
		}
		return Alamofire.request(method, URLString,
		                         parameters: parameters, encoding: encoding, headers: hdrs)

	}

}
