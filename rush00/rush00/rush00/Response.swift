//
//  Response.swift
//  rush00
//
//  Created by Thomas LE MEUR on 6/17/17.
//  Copyright © 2017 Thomas LE MEUR. All rights reserved.
//

import Foundation

struct Response {
    var id : Int
    var content: String
    var authorLogin: String
    var date: String
    
    static var allResponses: [Response] = []
}
