//: Playground - noun: a place where people can play

import Cocoa

enum Color : String  {
    case Coeur      = "heart"
    case Pique      = "spade"
    case Carreau    = "diamond"
    case Trefle     = "club"
    static let allColors: [Color] = [
        Coeur,
        Pique,
        Carreau,
        Trefle
    ]
}

//for col in Color.allColors {
//    print("\(col) : \(col.rawValue)")
//}


