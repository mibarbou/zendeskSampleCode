//
//  ArticlesMapper.swift
//  zendeskGuide
//
//  Created by Michel on 02/11/2017.
//  Copyright © 2017 mibarbou. All rights reserved.
//

import Foundation

struct ArticlesMapper {
	static func toGuideArticles(response: ArticlesResponse) -> GuideArticles? {
		guard let articlesResp = response.articles else { return nil }
		let articles = articlesResp.map{ toArticle(response: $0) }
		let nextPage = URL(string: response.nextPage ?? "")
		
		return GuideArticles(articles: articles,
							 nextPage: nextPage)
	}
	
	private static func toArticle(response: ArticleResponse) -> Article {
		let article = Article(title: response.title,
							  body: response.body ?? "",
							  updatedAt: Date())
		return article
	}
}
