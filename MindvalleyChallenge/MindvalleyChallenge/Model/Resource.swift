//
//  Resource.swift
//  MindvalleyChallenge
//
//  Created by Omar Samir on 9/14/18.
//  Copyright © 2018 Omar Samir. All rights reserved.
//

import UIKit

class Resource: NSObject {
    var id: String!
    var createdAt : Date!
    var width , height: Int!
    var color: String!
    var likes: Int!
    var likedByUser: Bool!
    var user: User!
    var currentUserCollections: [Any]!
    var urls: URLs!
    var categories: [Category]!
    var links: Links!
}
