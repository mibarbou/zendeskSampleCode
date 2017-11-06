//
//  DateFormatter+update.swift
//  zendeskGuide
//
//  Created by Michel Barbou Salvador on 02/11/2017.
//  Copyright © 2017 mibarbou. All rights reserved.
//

import Foundation

extension DateFormatter {
    static let updateArticle: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"   //2017-10-24T15:24:44Z
        return dateFormatter
    }()
    
    static let updateArticleViewModel: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.medium
        dateFormatter.timeStyle = DateFormatter.Style.short
        return dateFormatter
    }()
}
