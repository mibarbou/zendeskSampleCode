//
//  ArticleCell.swift
//  zendeskGuide
//
//  Created by Michel Barbou Salvador on 31/10/2017.
//  Copyright © 2017 mibarbou. All rights reserved.
//

import UIKit

class ArticleCell: UITableViewCell {
    static let identifier = "ArticleCell"
    
    @IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var bodyLabel: UILabel!
	@IBOutlet weak var updatedLabel: UILabel!
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
	
	func configureCell(article: Article) {
		self.titleLabel.text = article.title
        self.bodyLabel.attributedText = article.body
        if let updateDate = article.updatedAt {
            let formatter = DateFormatter.updateArticleViewModel
            self.updatedLabel.text = formatter.string(from: updateDate)
        } else {
            self.updatedLabel.text = ""
        }
	}
    
}
