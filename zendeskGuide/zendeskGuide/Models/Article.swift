//
//  Article.swift
//  zendeskGuide
//
//  Created by Michel on 02/11/2017.
//  Copyright © 2017 mibarbou. All rights reserved.
//

import Foundation

struct Article {
	let title: 		String
	let body:		NSAttributedString
	let updatedAt:	Date?
}

//MARK: - Equatable
extension Article: Equatable {
    static func ==(lhs: Article, rhs: Article) -> Bool {
        return lhs.proxyForComparison == rhs.proxyForComparison
    }
    
    var proxyForComparison : String{
        get{
            return "\(String(describing: title))" + "\(String(describing: body.string))" + "\(String(describing: updatedAt?.timeIntervalSince1970 ?? 0))"
        }
    }
}
