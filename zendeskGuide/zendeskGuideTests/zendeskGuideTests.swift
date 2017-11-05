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
    let json2: [String: Any] = UtilTest.readJson(fileName: "articles2")!
    let json3: [String: Any] = UtilTest.readJson(fileName: "articles3")!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
		
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
	
	func testGuideArticlesMapperMeasure() {
        // It takes a lot of time caused by the body html string conversion to
        // NSAttributedString, thats why I had to use GCD in the app
        // Commented to make the tests duration shorter
        self.measure {
//            let guideArticles = ArticlesMapper().getGuideArticles(response: self.json)
//            XCTAssertEqual(guideArticles?.articles.count, 30)
        }
	}
    
    func testArticleEquatable() {
        let title1 = "Halloween is coming! Tell us your scary ticket stories!"
        let bodyString1 = """
                            <p>It's almost Halloween! Don't be afraid to <a href=\"/hc/en-us/community/posts/115009366668\">share your scary ticket stories</a> this week in our community!</p>\n<p>And vote for the scary ticket stories you like! The one with the most votes at the end of day on Halloween will get a Zendesk t-shirt!</p>",
                                "source_locale": "en-us
                          """
        let bodyAttributedString1 = NSAttributedString(html: bodyString1)!
        let dateString1 = "2017-10-31T10:00:05Z"
        let date1 = ArticlesMapper().getDate(string: dateString1)!
        let article1 = Article(title: title1,
                               body: bodyAttributedString1,
                               updatedAt: date1)

        let title2 = "Halloween is coming! Tell us your scary ticket stories!"
        let bodyString2 = """
                            <p>It's almost Halloween! Don't be afraid to <a href=\"/hc/en-us/community/posts/115009366668\">share your scary ticket stories</a> this week in our community!</p>\n<p>And vote for the scary ticket stories you like! The one with the most votes at the end of day on Halloween will get a Zendesk t-shirt!</p>",
                                "source_locale": "en-us
                          """
        let bodyAttributedString2 = NSAttributedString(html: bodyString2)!
        let dateString2 = "2017-10-31T10:00:05Z"
        let date2 = ArticlesMapper().getDate(string: dateString2)!
        let article2 = Article(title: title2,
                               body: bodyAttributedString2,
                               updatedAt: date2)
        
        XCTAssertEqual(article1, article2)
    }
    
    func testGuideArticlesEquatable() {
        let title1 = "Halloween is coming! Tell us your scary ticket stories!"
        let bodyString1 = """
                            <p>It's almost Halloween! Don't be afraid to <a href=\"/hc/en-us/community/posts/115009366668\">share your scary ticket stories</a> this week in our community!</p>\n<p>And vote for the scary ticket stories you like! The one with the most votes at the end of day on Halloween will get a Zendesk t-shirt!</p>",
                                "source_locale": "en-us
                          """
        let bodyAttributedString1 = NSAttributedString(html: bodyString1)!
        let dateString1 = "2017-10-31T10:00:05Z"
        let date1 = ArticlesMapper().getDate(string: dateString1)!
        let article1 = Article(title: title1,
                               body: bodyAttributedString1,
                               updatedAt: date1)
        let article2 = Article(title: title1,
                               body: bodyAttributedString1,
                               updatedAt: date1)
        
        let nextPage1 = URL(string: "http://localhost/articles2.json")
        let guideArticles1 = GuideArticles(articles: [article1, article1],
                                           nextPage: nextPage1)
        let nextPage2 = URL(string: "http://localhost/articles2.json")
        let guideArticles2 = GuideArticles(articles: [article2, article2],
                                           nextPage: nextPage2)
        
        XCTAssertEqual(guideArticles1, guideArticles2)
    }
    
    func testGuideArticlesMapper() {
        let guideArticles = ArticlesMapper().getGuideArticles(response: self.json2)
        
        let title1 = "Halloween is coming! Tell us your scary ticket stories!"
        let title2 = "Announcing JIRA App v4"
        
        let bodyString1 = """
                            <p>It's almost Halloween! Don't be afraid to <a href=\"/hc/en-us/community/posts/115009366668\">share your scary ticket stories</a> this week in our community!</p>\n<p>And vote for the scary ticket stories you like! The one with the most votes at the end of day on Halloween will get a Zendesk t-shirt!</p>
                          """
        let bodyString2 = """
                           <p><span style=\"font-weight: 400;\"><strong>October 20th, 2017</strong> </span></p>\n<p><span style=\"font-weight: 400;\">We're excited to announce a redesign of the JIRA app for Zendesk Support. Version 4 adds many long-awaited usability improvements, like the user configurable issue creation form. The app is now also faster, better looking, and more functional. </span></p>\n<h2><strong>Main new features</strong></h2>\n<ul>\n<li style=\"font-weight: 400;\"><span style=\"font-weight: 400;\">Admins can configure which fields appear on the JIRA issue creation form in Support.</span></li>\n<li style=\"font-weight: 400;\"><span style=\"font-weight: 400;\">Keywords search for JIRA issues when from Support.</span></li>\n<li style=\"font-weight: 400;\"><span style=\"font-weight: 400;\">Ticket information can be automatically copied to the issue creation form.</span></li>\n<li style=\"font-weight: 400;\"><span style=\"font-weight: 400;\">Improved performance and usability thanks to the new Zendesk Apps framework. </span></li>\n</ul>\n<h2><strong>Configurable issue creation from </strong></h2>\n<p><span style=\"font-weight: 400;\">There is now an easy way to define which JIRA fields an agent sees when creating a new JIRA issue from Support, a significant enhancement introduced in the JIRA app v4.</span></p>\n<p><span style=\"font-weight: 400;\">These fields are specific to a particular JIRA project and issue type. Issue fields defined as \"required\" in JIRA will appear on the form regardless of configurations on this form.</span></p>\n<p><span style=\"font-weight: 400;\">Note that only Support admins can configure these fields for their agents.</span></p>\n<p><span style=\"font-weight: 400;\"><img src=\"https://support.zendesk.com/hc/article_attachments/115024643327/jirav4.png\" alt=\"jirav4.png\" /></span></p>\n<p><span style=\"font-weight: 400;\">All existing installations have been updated to the latest version of the JIRA app. No customer action is required.</span></p>\n<p><span style=\"font-weight: 400;\">For information on working with the new app, see <a href=\"/hc/en-us/articles/203660196\" target=\"_blank\" rel=\"noopener\">Setting up the JIRA for Zendesk Support integration</a> and </span><a href=\"/hc/en-us/articles/203660206\"><span style=\"font-weight: 400;\">Using the JIRA for Zendesk Support integration</span></a><span style=\"font-weight: 400;\">.</span></p>\n<h2><strong>FAQ</strong></h2>\n<p><span style=\"font-weight: 400;\">Q: Can I use both the old app (v3) and the new one  (v4) at the same time? </span></p>\n<p><span style=\"font-weight: 400;\">A: App v4 is designed to supersede the previous version. This means that after the upgrade to v4, the previous version will no longer be available. </span></p>\n<p><span style=\"font-weight: 400;\">Q: Do I need to do anything after upgrading to v4?</span></p>\n<p><span style=\"font-weight: 400;\">A: The app will configured automatically and ready to use. Admins can take advantage of the new features like configuring the form fields. </span></p>\n<p><span style=\"font-weight: 400;\">Q: Has any feature been removed from the app v4?</span></p>\n<p><span style=\"font-weight: 400;\">A: The updated app is superset of the previously available features. </span></p>\n<p> </p>
                          """
        
        let bodyAttributedString1 = NSAttributedString(html: bodyString1)!
        let bodyAttributedString2 = NSAttributedString(html: bodyString2)!
        
        let dateString1 = "2017-10-31T10:00:05Z"
        let dateString2 = "2017-10-30T16:55:19Z"
        
        let date1 = ArticlesMapper().getDate(string: dateString1)!
        let date2 = ArticlesMapper().getDate(string: dateString2)!
        
        let article1 = Article(title: title1,
                               body: bodyAttributedString1,
                               updatedAt: date1)
        let article2 = Article(title: title2,
                               body: bodyAttributedString2,
                               updatedAt: date2)
        
        let nextPage = URL(string: "http://localhost/articles3.json")
        
        let expectedGuideArticles = GuideArticles(articles: [article1, article2],
                                                  nextPage: nextPage)
        
        XCTAssertEqual(guideArticles!.articles.count, 2)
        XCTAssertEqual(guideArticles!, expectedGuideArticles)
    }
    
    
    func testGuideArticlesReducer() {
        let initialState = GuideArticlesReducer().initialState
        
        let guideArticlesFirst = ArticlesMapper().getGuideArticles(response: self.json2)!
        let expectedFirstState = GuideArticlesState(articles: guideArticlesFirst.articles,
                                                    nextPage: guideArticlesFirst.nextPage,
                                                    isLoading: false)
        
        let actionFirstPage = ArticlesFetchedAction(articles: guideArticlesFirst.articles,
                                                    nextPage: guideArticlesFirst.nextPage)
        
        let firstState = GuideArticlesReducer().reduce(state: initialState, action: actionFirstPage)!
        XCTAssertEqual(firstState, expectedFirstState)
        
        let guideArticlesSecond = ArticlesMapper().getGuideArticles(response: self.json3)!
        let allArticles = guideArticlesFirst.articles + guideArticlesSecond.articles
        let expectedSecondState = GuideArticlesState(articles: allArticles,
                                                    nextPage: nil,
                                                    isLoading: false)
        
        let actionNextPage = ArticlesNextPageFetchedAction(articles: guideArticlesSecond.articles,
                                                             nextPage: guideArticlesSecond.nextPage)
        let secondState = GuideArticlesReducer().reduce(state: firstState, action: actionNextPage)!
        XCTAssertEqual(secondState, expectedSecondState)
        
        
        let expectedChangedStatusState = GuideArticlesState(articles: initialState.articles,
                                                            nextPage: initialState.nextPage,
                                                            isLoading: false)
        let changedStatusState = GuideArticlesReducer().reduce(state: initialState, action: ChangeLoadingStatusAction())
        XCTAssertEqual(changedStatusState, expectedChangedStatusState)
  
    }
    
}


