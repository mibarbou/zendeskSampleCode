//
//  ArticlesTableViewController.swift
//  zendeskGuide
//
//  Created by Michel Barbou Salvador on 31/10/2017.
//  Copyright © 2017 mibarbou. All rights reserved.
//

import UIKit

class ArticlesTableViewController: UITableViewController {
    
    let searchController = UISearchController(searchResultsController: nil)
		
	var state: GuideArticlesState = GuideArticlesReducer().initialState {
		didSet {
			tableView.reloadData()
		}
	}

    override func viewDidLoad() {
        super.viewDidLoad()
		setup()
		
		store.addListener(forStateType: GuideArticlesState.self) { [weak self] newState in
			self?.state = newState
		}.linkLifeCycleTo(object: self)
		
		store.dispatch(action: FetchArticlesAsyncAction())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	fileprivate func setup(){
		self.title = "Articles"
        navigationController?.navigationBar.prefersLargeTitles = true
		let nib = UINib(nibName: ArticleCell.identifier, bundle: nil)
		tableView.register(nib, forCellReuseIdentifier: ArticleCell.identifier)
		tableView.estimatedRowHeight = 60.0
		tableView.rowHeight = UITableViewAutomaticDimension
        tableView.allowsSelection = false
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Articles by Title"
		searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
        definesPresentationContext = true
	}


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if state.isFiltering {
            return state.filteredArticles.count
        }
        return state.articles.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ArticleCell.identifier, for: indexPath) as! ArticleCell

        // Configure the cell...
        var article: Article
        if state.isFiltering {
            article = state.filteredArticles[indexPath.row]
        } else {
            article = state.articles[indexPath.row]
        }
        cell.configureCell(article: article)
        
        return cell
    }
	
	//MARK: - UIScrollView Delegate
	override func scrollViewDidScroll(_ scrollView: UIScrollView) {
		let offsetY = scrollView.contentOffset.y
		let contentHeight = scrollView.contentSize.height
		if offsetY > contentHeight - scrollView.frame.size.height,
			let nextPage = state.nextPage,
			!state.isLoading,
            !state.isFiltering {
			print("get more articles with url: \(nextPage)")
			store.dispatch(action: FecthArticlesNextPageAsyncAction(url: nextPage))
			store.dispatch(action: ChangeLoadingStatusAction())
		}
	}

}


extension ArticlesTableViewController: UISearchResultsUpdating, UISearchBarDelegate {
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        if searchController.isActive {
            store.dispatch(action: ChangeFilterStatusAction(isFiltering: true))
        } else {
            store.dispatch(action: ChangeFilterStatusAction(isFiltering: false))
        }
    }
	
	// MARK: - UISearchBar Delegate
	func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
		store.dispatch(action: FilterArticlesAction(query: searchController.searchBar.text))
	}
	
}










