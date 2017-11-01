//
//  ApiError.swift
//  zendeskGuide
//
//  Created by Michel Barbou Salvador on 31/10/2017.
//  Copyright © 2017 mibarbou. All rights reserved.
//

import Foundation

enum ApiError :Error {
    case serverError(message: String)
    case defaultError
    case parserError
    case noConnection
}
