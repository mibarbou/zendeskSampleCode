//
//  ArticlesMapper.swift
//  zendeskGuide
//
//  Created by Michel on 02/11/2017.
//  Copyright © 2017 mibarbou. All rights reserved.
//

import Foundation

struct ArticlesMapper {
    
    public func getGuideArticles(response: [String : Any]) -> GuideArticles? {
        guard let articlesResponse = ArticlesResponse(json: response) else {
            return nil
        }
        guard let guideArticles = toGuideArticles(response: articlesResponse) else {
            return nil
        }
        return guideArticles
    }
    
	private func toGuideArticles(response: ArticlesResponse) -> GuideArticles? {
		guard let articlesResp = response.articles else { return nil }
		let articles = articlesResp.map{ toArticle(response: $0) }
		let nextPage = URL(string: response.nextPage ?? "")
		
		return GuideArticles(articles: articles,
							 nextPage: nextPage)
	}
	
	private func toArticle(response: ArticleResponse) -> Article {
        let bodyHtml = NSAttributedString(html: response.body ?? "")
		let article = Article(title: response.title,
                              body: bodyHtml!,
							  updatedAt: getDate(string: response.updatedAt))
		return article
	}
    
    public func getDate(string: String?) -> Date? {
        guard let dateString = string else { return nil }
        let formatter = DateFormatter.updateArticle
        return formatter.date(from: dateString)
    }
    

}
