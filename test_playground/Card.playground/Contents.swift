//: Playground - noun: a place where people can play

import Foundation

//public class NSObject {
//    var color: String       = ""
//    var value: Int          = 0
//    var description: String = ""
//    
//    func isEqual(str:String, nb:Int) -> Bool {
//        if (self.color == str && self.value == nb) {
//            return (true)
//        }
//        else {
//            return false
//        }
//        
//    }
//}

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

enum Value : Int  {
    case Ace = 1, Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten, Jack, Queen, King
    static let allValues: [Value] = [
        Ace, Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten, Jack, Queen, King
    ]
}

// CARD

class Card : NSObject  {

    var color: String       = ""
    var value: Int          = 0
    
    override public var description: String {
        get {
            return ("Description overriding")
        }
        set {
            
        }
    }
    
    override func isEqual(_ object: Any?) -> Bool {
        let card = object as? Card
        return self.color == card?.color && self.value == card?.value
    }

}

func == (card1:Card, card2:Card) -> Bool {
    return (card1.color == card2.color && card1.value == card2.value)
}

let card : Card = Card()

card.color = Color.Coeur.rawValue
card.value = Value.Ace.rawValue

let card2 : Card = Card()

card2.color = Color.Coeur.rawValue
card2.value = Value.Four.rawValue

print(card.isEqual(card2))