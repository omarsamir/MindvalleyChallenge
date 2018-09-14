//
//  User.swift
//  MindvalleyChallenge
//
//  Created by Omar Samir on 9/14/18.
//  Copyright © 2018 Omar Samir. All rights reserved.
//

import UIKit
import ObjectMapper

class User: NSObject, Mappable {
    var id: String!
    var username: String!
    var name: String!
    var links: Links!
    var profile_image: ProfileImage!
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id             <- map["id"]
        username       <- map["username"]
        name           <- map["name"]
        links          <- map["id"]
        profile_image  <- map["profile_image"]
    }
}
