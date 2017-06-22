//: Playground - noun: a place where people can play

import Cocoa

enum Value : Int  {
    case Ace = 1, Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten, Jack, Queen, King
    static let allValues: [Value] = [
        Ace, Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten, Jack, Queen, King
    ]
}

//for val in Value.allValues {
//    print("\(val) : \(val.rawValue)")
//}
//
