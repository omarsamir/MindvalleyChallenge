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
        self.backgroundColor = UIColor(hexString: resource.color)
    }
    
}

extension UIColor {
    public convenience init?(hexString: String) {
        let r, g, b, a: CGFloat
        
        if hexString.hasPrefix("#") {
            let start = hexString.index(hexString.startIndex, offsetBy: 1)
            let hexColor = String(hexString[start...])
            
            if hexColor.count == 6 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                
                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255
                    
                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }
        
        return nil
    }
}
