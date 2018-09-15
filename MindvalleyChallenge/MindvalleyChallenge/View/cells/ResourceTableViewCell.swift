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
    
    func set(resource: Resource){
        usernameLabel.text = resource.user.username
        userFullName.text = resource.user.name
        createdAtLabel.text = resource.created_at
        numberOfLikesLabel.text = String(resource.likes)
        resourceProfileImageView.sd_setImage(with: URL(string: resource.urls.regular), placeholderImage: UIImage(named: Constants.GREY_PLACEHOLDER_IMAGE_NAME), options: .refreshCached, completed: nil)
        userProfileImageView.sd_setImage(with: URL(string: resource.user.profile_image.large), placeholderImage: UIImage(named: Constants.GREY_PLACEHOLDER_IMAGE_NAME), options: .refreshCached, completed: nil)
        
        if resource.liked_by_user {
            isLikeImageView.image = UIImage(named: Constants.LIKE_IMAGE_NAME)
        }else{
            isLikeImageView.image = UIImage(named: Constants.DISLIKE_IMAGE_NAME)
        }
        
        var categoriesString : String = ""
        for category in resource.categories {
            categoriesString.append(" #"+category.title)
            
            if category.id != resource.categories.last?.id {
                    categoriesString.append(", ")
            }
            
        }
        categoriesLabel.text = categoriesString
    }
    
}
