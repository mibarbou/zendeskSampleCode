//
//  ApiClient.swift
//  zendeskGuide
//
//  Created by Michel Barbou Salvador on 31/10/2017.
//  Copyright © 2017 mibarbou. All rights reserved.
//

import Foundation
import Alamofire

class ApiClient {
    
    static let manager: SessionManager = {
        return Alamofire.SessionManager.default
    }()
    
    static let headers = ["Content-type": "application/x-www-form-urlencoded"]
    
    fileprivate static func request(endpoint: Endpoint,
                                    success: @escaping ([String : Any])->(),
                                    fail: @escaping (ApiError)->()) {
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
 
        let _ = ApiClient.manager.request(endpoint.path,
                                          method: endpoint.method,
                                          parameters: endpoint.parameters,
                                          encoding: URLEncoding.default,
                                          headers: headers).responseJSON { (response) in
                                            
                                            switch response.result {
                                                case .success(let json):
                                                    guard let theJson = json as? [String : Any] else {
                                                        fail(.parserError)
                                                        return
                                                    }
                                                    //debugPrint(theJson)
                                                    success(theJson)
                                                case .failure(let error):
                                                    print("Request failed with error: \(error)")
                                                    if let errorCode = response.error?._code,
                                                        Int(errorCode) == -1009{
                                                        fail(ApiError.noConnection)
                                                    } else {
                                                        fail(ApiError.defaultError)
                                                    }
                                            }
        }
    }
}


//MARK: Public methods
extension ApiClient {
	
    public static func articles(success: @escaping (GuideArticles) -> (),
                                fail: @escaping (ApiError) -> ()) {
        
        self.request(endpoint: .articles,
                     success: { (response) in
                        DispatchQueue.global(qos: .background).async {
                            guard let guideArticles = ArticlesMapper().getGuideArticles(response: response) else {
                                stopNetworkIndicator()
                                fail(.parserError)
                                return
                            }
                            stopNetworkIndicator()
                            success(guideArticles)
                        }
        }) { (error) in
            fail(error)
        }
    }
	
	public static func articlesNextPage(url: URL,
										success: @escaping (GuideArticles) -> (),
										fail: @escaping (ApiError) -> ()) {
		
		self.request(endpoint: .articlesNextPage(url: url),
					 success: { (response) in
                        DispatchQueue.global(qos: .background).async {
                            guard let guideArticles = ArticlesMapper().getGuideArticles(response: response) else {
                                stopNetworkIndicator()
                                fail(.parserError)
                                return
                            }
                            stopNetworkIndicator()
                            success(guideArticles)
                        }
		}) { (error) in
			fail(error)
		}
		
	}
    
    
    fileprivate static func stopNetworkIndicator()  {
        DispatchQueue.main.async {
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
    }
}




























