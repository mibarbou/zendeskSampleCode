//
//  ArticleResponse.swift
//  zendeskGuide
//
//  Created by Michel Barbou Salvador on 31/10/2017.
//  Copyright © 2017 mibarbou. All rights reserved.
//

import Gloss

struct ArticleResponse: Gloss.Decodable {
    
    let id:                 Int?
    let url:                String?
    let htmlUrl:            String?
    let authorId:           Int?
    let title:              String
    let body:               String?
    let locale:             String
    let sourceLocale:       String?
    let commentsDisabled:   Bool?
    let outdatedLocales:    [String]?
    let outdated:           Bool?
    let labelNames:         [String]?
    let draft:              Bool?
    let promoted:           Bool?
    let position:           Int?
    let voteSum:            Int?
    let voteCount:          Int?
    let sectionId:          Int?
    let createdAt:          String?
    let updatedAt:          String?
    
    init?(json: JSON) {
        self.id = "id" <~~ json
        self.url = "url" <~~ json
        self.htmlUrl = "html_url" <~~ json
        self.authorId = "author_id" <~~ json
        guard let title: String = "title" <~~ json else { return nil }
        self.title = title
        self.body = "body" <~~ json
        guard let locale: String = "locale" <~~ json else { return nil }
        self.locale = locale
        self.sourceLocale = "source_locale" <~~ json
        self.commentsDisabled = "comments_disabled" <~~ json
        self.outdatedLocales = "outdated_locales" <~~ json
        self.outdated = "outdated" <~~ json
        self.labelNames = "label_names" <~~ json
        self.draft = "draft" <~~ json
        self.promoted = "promoted" <~~ json
        self.position = "position" <~~ json
        self.voteSum = "vote_sum" <~~ json
        self.voteCount = "vote_count" <~~ json
        self.sectionId = "section_id" <~~ json
        self.createdAt = "created_at" <~~ json
        self.updatedAt = "updated_at" <~~ json
    }
}
