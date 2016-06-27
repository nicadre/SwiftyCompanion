//
//  AppDelegate.swift
//  SwiftyCompanion
//
//  Created by Nicolas Chevalier on 22/06/16.
//  Copyright © 2016 Nicolas Chevalier. All rights reserved.
//

import UIKit
import AlamofireNetworkActivityIndicator

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?

	func application(application: UIApplication,
	                 didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

		NetworkActivityIndicatorManager.sharedManager.isEnabled = true

		return true

	}
}

// MARK: - Handle urls
extension AppDelegate {

	func application(application: UIApplication,
	                 openURL url: NSURL,
					 sourceApplication: String?,
					 annotation: AnyObject) -> Bool {

		APIRequester.sharedInstance.oauth2.handleRedirectURL(url)

		return true

	}

}
