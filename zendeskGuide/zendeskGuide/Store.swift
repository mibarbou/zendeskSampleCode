//
//  Store.swift
//  zendeskGuide
//
//  Created by Michel on 02/11/2017.
//  Copyright © 2017 mibarbou. All rights reserved.
//

import Foundation
import Suas

let store = Suas.createStore(reducer: GuideArticlesReducer(),
							 middleware: AsyncMiddleware())
