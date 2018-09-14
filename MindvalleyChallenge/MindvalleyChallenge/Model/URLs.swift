//
//  URLs.swift
//  MindvalleyChallenge
//
//  Created by Omar Samir on 9/14/18.
//  Copyright © 2018 Omar Samir. All rights reserved.
//

import UIKit
import ObjectMapper

class URLs: NSObject,Mappable {
    var raw: String!
    var full: String!
    var regular: String!
    var small: String!
    var thumb: String!
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        raw  <- map["raw"]
        full  <- map["full"]
        regular  <- map["regular"]
        small  <- map["small"]
        thumb  <- map["thumb"]
    }
    
}
