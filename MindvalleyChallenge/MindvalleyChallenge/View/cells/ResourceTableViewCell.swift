//
//  TableViewCell.swift
//  MindvalleyChallenge
//
//  Created by Omar Samir on 9/15/18.
//  Copyright © 2018 Omar Samir. All rights reserved.
//

import UIKit

class ResourceTableViewCell: UITableViewCell {
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var resourceProfileImageView: UIImageView!
    @IBOutlet weak var isLikeImageView: UIImageView!
    @IBOutlet weak var createdAtLabel: UILabel!
    @IBOutlet weak var numberOfLikesLabel: UILabel!
    @IBOutlet weak var userFullName: UILabel!
    @IBOutlet weak var userProfileImageView: UIImageView!
    @IBOutlet weak var categoriesLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
