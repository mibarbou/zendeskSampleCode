//
//  GuideArticlesState.swift
//  zendeskGuide
//
//  Created by Michel on 03/11/2017.
//  Copyright © 2017 mibarbou. All rights reserved.
//

import Foundation

struct GuideArticlesState {
	var articles: 	[Article]
	var nextPage:	URL?
	var isLoading: 	Bool
}
