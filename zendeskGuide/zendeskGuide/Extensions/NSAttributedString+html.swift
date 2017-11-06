//
//  NSAttributedString+html.swift
//  zendeskGuide
//
//  Created by Michel Barbou Salvador on 02/11/2017.
//  Copyright © 2017 mibarbou. All rights reserved.
//

import Foundation

extension NSAttributedString {
    internal convenience init?(html: String) {
        guard let data = html.data(using: String.Encoding.utf16, allowLossyConversion: false) else {
            return nil
        }
        guard let attributedString = try? NSMutableAttributedString(data: data, options: [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil) else {
            return nil
        }
        self.init(attributedString: attributedString)
    }
}
