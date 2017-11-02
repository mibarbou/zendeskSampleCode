//
//  ArticlesTableViewController.swift
//  zendeskGuide
//
//  Created by Michel Barbou Salvador on 31/10/2017.
//  Copyright © 2017 mibarbou. All rights reserved.
//

import UIKit

class ArticlesTableViewController: UITableViewController {
	
	var state: GuideArticles = GuideArticlesReducer().initialState {
		didSet {
			tableView.reloadData()
		}
	}

    override func viewDidLoad() {
        super.viewDidLoad()
		setup()
		
		store.addListener(forStateType: GuideArticles.self) { [weak self] newState in
			self?.state = newState
		}.linkLifeCycleTo(object: self)
		
		store.dispatch(action: FetchArticlesAsyncAction())

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	func setup(){
		self.title = "Articles"
		let nib = UINib(nibName: ArticleCell.identifier, bundle: nil)
		tableView.register(nib, forCellReuseIdentifier: ArticleCell.identifier)
	}

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return state.articles.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ArticleCell.identifier, for: indexPath) as! ArticleCell

        // Configure the cell...
		let article = state.articles[indexPath.row]
        cell.titleLabel.text = article.title
        
        return cell
    }

}
