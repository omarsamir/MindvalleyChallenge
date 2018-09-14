//
//  Profile_image.swift
//  MindvalleyChallenge
//
//  Created by Omar Samir on 9/14/18.
//  Copyright © 2018 Omar Samir. All rights reserved.
//

import UIKit
import ObjectMapper

class ProfileImage: NSObject,Mappable {
     var small: String!
     var medium: String!
     var large: String!
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        small  <- map["small"]
        medium <- map["medium"]
        large  <- map["large"]
    }
}
