//
//  FetchArticlesNextPageAsyncAction.swift
//  zendeskGuide
//
//  Created by Michel on 02/11/2017.
//  Copyright © 2017 mibarbou. All rights reserved.
//

import Foundation
import Suas

struct FecthArticlesNextPageAsyncAction: AsyncAction {
	let url: URL
	
	init(url: URL) {
		self.url = url
	}
	
	func execute(getState: @escaping GetStateFunction, dispatch: @escaping DispatchFunction) {
		ApiClient.articlesNextPage(url: self.url,
								   success: { (guideArticles) in
									dispatch(ArticlesNextPageFetchedAction(articles: guideArticles.articles,
																		   nextPage: guideArticles.nextPage,
																		   isLoading: false))
		}) { (error) in
			print(error)
		}
	}
}
