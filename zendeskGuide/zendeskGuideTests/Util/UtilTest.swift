//
//  UtilTest.swift
//  zendeskGuideTests
//
//  Created by Michel on 03/11/2017.
//  Copyright © 2017 mibarbou. All rights reserved.
//

import Foundation

struct UtilTest {
	static func readJson(fileName: String) -> [String: Any]? {
		do {
			if let file = Bundle(for: zendeskGuideTests.self).url(forResource: fileName, withExtension: "json") {
				let data = try Data(contentsOf: file)
				let json = try JSONSerialization.jsonObject(with: data, options: [])
				if let object = json as? [String: Any] {
					// json is a dictionary
					print(object)
					return object
				} else if let object = json as? [Any] {
					// json is an array
					print(object)
					return nil
				} else {
					print("JSON is invalid")
					return nil
				}
			} else {
				return nil
			}
		} catch {
			print(error.localizedDescription)
			return nil
		}
	}
}
