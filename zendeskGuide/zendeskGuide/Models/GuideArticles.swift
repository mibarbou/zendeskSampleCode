//
//  GuideArticles.swift
//  zendeskGuide
//
//  Created by Michel on 02/11/2017.
//  Copyright © 2017 mibarbou. All rights reserved.
//

import Foundation

struct GuideArticles: Equatable {
    
	let articles: 	[Article]
	let nextPage:	URL?
    
    static func ==(lhs: GuideArticles, rhs: GuideArticles) -> Bool {
        return (lhs.articles == rhs.articles) && (lhs.proxyForComparison == rhs.proxyForComparison)
    }
    
    var proxyForComparison : String{
        get{
            return "\(nextPage?.absoluteString ?? "")"
        }
    }
}
