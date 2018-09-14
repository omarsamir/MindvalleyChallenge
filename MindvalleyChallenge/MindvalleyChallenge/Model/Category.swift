//
//  Category.swift
//  MindvalleyChallenge
//
//  Created by Omar Samir on 9/14/18.
//  Copyright © 2018 Omar Samir. All rights reserved.
//

import UIKit
import ObjectMapper

class Category: NSObject,Mappable {
    var id: String!
    var title: String!
    var photo_count: Int!
    var links:Links!
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id           <- map["id"]
        title        <- map["title"]
        photo_count  <- map["photo_count"]
        links        <- map["links"]
    }
    
}
