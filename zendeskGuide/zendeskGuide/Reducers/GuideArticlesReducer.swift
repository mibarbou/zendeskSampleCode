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
    var initialState = GuideArticlesState(articles: [],
                                          filteredArticles: [],
                                          nextPage: nil,
                                          isLoading: true,
                                          isFiltering: false)
	
	func reduce(state: GuideArticlesState, action: Action) -> GuideArticlesState? {
		
		if let _ = action as? ChangeLoadingStatusAction {
			let isLoading = !state.isLoading
            return GuideArticlesState(articles: state.articles,
                                      filteredArticles: [],
                                      nextPage: state.nextPage,
                                      isLoading: isLoading,
                                      isFiltering: state.isFiltering)
		}
		
		if let action = action as? ArticlesFetchedAction {
            return GuideArticlesState(articles: action.articles,
                                      filteredArticles: [],
                                      nextPage: action.nextPage,
                                      isLoading: false,
                                      isFiltering: state.isFiltering)
		}
		
		if let action = action as? ArticlesNextPageFetchedAction {
			let totalArticles = state.articles + action.articles
            return GuideArticlesState(articles: totalArticles,
                                      filteredArticles: [],
                                      nextPage: action.nextPage,
                                      isLoading: false,
                                      isFiltering: state.isFiltering)
		}
        
        if let action = action as? FilterArticlesAction {
            if let q = action.query,
                q.count > 3 {
                let filteredArticles = state.articles.filter{ $0.title.lowercased().contains(q.lowercased()) }
                return GuideArticlesState(articles: state.articles,
                                          filteredArticles: filteredArticles,
                                          nextPage: state.nextPage,
                                          isLoading: true,
                                          isFiltering: state.isFiltering)
            }
        }
        
        if let action = action as? ChangeFilterStatusAction {
            return GuideArticlesState(articles: state.articles,
                                      filteredArticles: [],
                                      nextPage: state.nextPage,
                                      isLoading: state.isLoading,
                                      isFiltering: action.isFiltering)
        }
        
		return nil
	}
    
}


extension GuideArticlesReducer {
    
}



