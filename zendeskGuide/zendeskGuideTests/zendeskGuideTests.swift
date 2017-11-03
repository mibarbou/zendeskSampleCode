//
//  zendeskGuideTests.swift
//  zendeskGuideTests
//
//  Created by Michel Barbou Salvador on 31/10/2017.
//  Copyright © 2017 mibarbou. All rights reserved.
//

import XCTest
@testable import zendeskGuide

class zendeskGuideTests: XCTestCase {
	
	let json: [String: Any] = UtilTest.readJson(fileName: "articles")!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
		
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
	
	func testGuideArticlesMapper() {
		let guideArticles = ArticlesMapper().getGuideArticles(response: self.json)

		XCTAssertEqual(guideArticles?.articles.count, 30)
	}
    
}
