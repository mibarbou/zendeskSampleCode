//
//  GuideArticlesState.swift
//  zendeskGuide
//
//  Created by Michel on 03/11/2017.
//  Copyright © 2017 mibarbou. All rights reserved.
//

import Foundation

struct GuideArticlesState {
	var articles: 	        [Article]
    var filteredArticles:   [Article]
	var nextPage:	        URL?
	var isLoading: 	        Bool
    var isFiltering:        Bool
}

//MARK: - Equatable
extension GuideArticlesState: Equatable {
    static func ==(lhs: GuideArticlesState, rhs: GuideArticlesState) -> Bool {
        return (lhs.articles == rhs.articles) &&
			(lhs.filteredArticles == rhs.filteredArticles) &&
            (lhs.proxyForComparison == rhs.proxyForComparison) &&
            lhs.isLoading == rhs.isLoading &&
			lhs.isFiltering == rhs.isFiltering
    }
    
    var proxyForComparison : String{
        get{
            return "\(nextPage?.absoluteString ?? "")"
        }
    }
}
