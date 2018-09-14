//
//  Resource.swift
//  MindvalleyChallenge
//
//  Created by Omar Samir on 9/14/18.
//  Copyright © 2018 Omar Samir. All rights reserved.
//

import UIKit
import ObjectMapper

class Resource: NSObject,Mappable {
    var id: String!
    var created_at : String!
    var width , height: Int!
    var color: String!
    var likes: Int!
    var liked_by_user: Bool!
    var user: User!
    var currentUserCollections: [Any]!
    var urls: URLs!
    var categories: [Category]!
    var links: Links!
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id                     <- map["id"]
        created_at             <- map["created_at"]
        width                  <- map["width"]
        color                  <- map["color"]
        likes                  <- map["likes"]
        liked_by_user          <- map["liked_by_user"]
        user                   <- map["user"]
        currentUserCollections <- map["currentUserCollections"]
        urls                   <- map["urls"]
        categories             <- map["categories"]
        links                  <- map["links"]
    }
}
