//
//  GuideArticlesReducer.swift
//  zendeskGuide
//
//  Created by Michel on 02/11/2017.
//  Copyright © 2017 mibarbou. All rights reserved.
//

import Foundation
import Suas

struct GuideArticlesReducer: Reducer {
	var initialState = GuideArticles(articles: [], nextPage: nil)
	
	func reduce(state: GuideArticles, action: Action) -> GuideArticles? {
		
		if let action = action as? ArticlesFetchedAction {
			return GuideArticles(articles: action.articles,
								 nextPage: action.nextPage)
		}
		
		if let action = action as? ArticlesNextPageFetchedAction {
			let totalArticles = state.articles + action.articles
			return GuideArticles(articles: totalArticles,
								 nextPage: action.nextPage)
		}
		return nil
	}
	
}
