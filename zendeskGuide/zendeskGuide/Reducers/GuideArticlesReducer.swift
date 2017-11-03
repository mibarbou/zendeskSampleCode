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
	var initialState = GuideArticlesState(articles: [], nextPage: nil, isLoading: true)
	
	func reduce(state: GuideArticlesState, action: Action) -> GuideArticlesState? {
		
		if let action = action as? ChangeLoadingStatusAction {
			let isLoading = !action.isLoading
			return GuideArticlesState(articles: state.articles,
									  nextPage: state.nextPage,
									  isLoading: isLoading)
		}
		
		if let action = action as? ArticlesFetchedAction {
			return GuideArticlesState(articles: action.articles,
									  nextPage: action.nextPage,
									  isLoading: false)
		}
		
		if let action = action as? ArticlesNextPageFetchedAction {
			let totalArticles = state.articles + action.articles
			return GuideArticlesState(articles: totalArticles,
									  nextPage: action.nextPage,
									  isLoading: false)
		}
		return nil
	}
	
}
