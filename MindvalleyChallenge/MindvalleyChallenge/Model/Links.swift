//
//  Links.swift
//  MindvalleyChallenge
//
//  Created by Omar Samir on 9/14/18.
//  Copyright © 2018 Omar Samir. All rights reserved.
//

import UIKit
import ObjectMapper

class Links: NSObject,Mappable {
     var linksSelf: String!
     var html: String!
     var photos: String!
     var likes: String!
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        linksSelf  <- map["linksSelf"]
        html       <- map["html"]
        photos     <- map["photos"]
        likes      <- map["likes"]
    }
    
}
