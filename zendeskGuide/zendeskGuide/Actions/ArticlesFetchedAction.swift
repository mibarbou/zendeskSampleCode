//
//  ArticlesFetchedAction.swift
//  zendeskGuide
//
//  Created by Michel on 02/11/2017.
//  Copyright © 2017 mibarbou. All rights reserved.
//

import Foundation
import Suas

struct ArticlesFetchedAction: Action {
	let articles: [Article]
	let nextPage: URL?
	let isLoading: 	Bool
}
