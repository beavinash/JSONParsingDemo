//
//  User.swift
//  JSONParsingDemo
//
//  Created by Avinash Reddy on 12/30/18.
//  Copyright © 2018 Avinash Reddy. All rights reserved.
//

import Foundation

struct User {
    var userID: Int
    var id: Int
    var title: String
    var completed: Bool
    
    init(_ dictionary: [String: Any]) {
        self.userID = dictionary["userId"] as? Int ?? 0
        self.id = dictionary["id"] as? Int ?? 0
        self.title = dictionary["title"] as? String ?? ""
        self.completed = dictionary["completed"] as? Bool ?? false
    }
}
