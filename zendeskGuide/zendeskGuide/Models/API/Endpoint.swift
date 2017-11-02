//
//  ApiClient.swift
//  zendeskGuide
//
//  Created by Michel Barbou Salvador on 31/10/2017.
//  Copyright © 2017 mibarbou. All rights reserved.
//

import Foundation
import Alamofire


let baseURL: String = "https://support.zendesk.com/api/v2/help_center/en-us"

enum Endpoint {
    case articles
	case articlesNextPage(url: URL)
}

//MARK: - method
extension Endpoint {
     var method: Alamofire.HTTPMethod {
        switch self {
        case .articles, .articlesNextPage:
            return .get
        }
    }
}

//MARK: - path
extension Endpoint {
     var path: String {
        switch self {
        case .articles:
            return baseURL + "/articles.json"
		case let .articlesNextPage(url: u):
			return "\(u)"
        }
    }
}

//MARK: - parameters
extension Endpoint {
     var parameters: [String : String] {
        switch self {
		case .articles, .articlesNextPage:
            return [:]
        }
    }
}














