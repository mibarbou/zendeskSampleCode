//
//  FetchArticlesAsyncAction.swift
//  zendeskGuide
//
//  Created by Michel on 02/11/2017.
//  Copyright © 2017 mibarbou. All rights reserved.
//

import Foundation
import Suas

struct FetchArticlesAsyncAction: AsyncAction {
	
	func execute(getState: @escaping GetStateFunction, dispatch: @escaping DispatchFunction) {
		ApiClient.articles(success: { (guideArticles) in
			dispatch(ArticlesFetchedAction(articles: guideArticles.articles,
										   nextPage: guideArticles.nextPage,
										   isLoading: false))
		}) { (error) in
			print(error)
		}
	}
}
