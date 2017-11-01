//
//  ArticlesResponse.swift
//  zendeskGuide
//
//  Created by Michel Barbou Salvador on 31/10/2017.
//  Copyright © 2017 mibarbou. All rights reserved.
//

import Gloss

struct ArticlesResponse: Gloss.Decodable {
    let count:              Int?
    let nextPage:           String?
    let page:               Int?
    let pageCount:          Int?
    let perPage:            Int?
    let previousPage:       Int?
    let sortBy:             String?
    let sortOrder:          String?
    let articles:           [ArticleResponse]?
    
    init?(json: JSON) {
        self.count = "count" <~~ json
        self.nextPage = "next_page" <~~ json
        self.page = "page" <~~ json
        self.pageCount = "page_count" <~~ json
        self.perPage = "per_page" <~~ json
        self.previousPage = "previous_page" <~~ json
        self.sortBy = "sort_by" <~~ json
        self.sortOrder = "sort_order" <~~ json
        guard let articles: [ArticleResponse] = "articles" <~~ json else {
            return nil
        }
        self.articles = articles
    }
}
