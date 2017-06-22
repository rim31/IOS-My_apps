//
//  Topic.swift
//  rush00
//
//  Created by Thomas LE MEUR on 6/17/17.
//  Copyright © 2017 Thomas LE MEUR. All rights reserved.
//

import Foundation

struct Topic {
    var id : Int
    var name: String
    var content: String
    var authorLogin: String
    var date: String
    
    
    static var allTopics: [Topic] = []
}
