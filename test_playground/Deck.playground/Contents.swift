//: Playground - noun: a place where people can play

import Foundation

enum Color : String  {
    case Heart      = "heart"
    case Spade      = "spade"
    case Diamond    = "diamond"
    case Club     = "club"
    static let allColors: [Color] = [
        Heart  ,
        Spade  ,
        Diamond,
        Club
    ]
}

enum Value : Int  {
    case Ace = 1, Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten, Jack, Queen, King
    static let allValues: [Value] = [
        Ace, Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten, Jack, Queen, King
    ]
}


class Card : NSObject  {
    
    var color: Color
    var value: Value
    
    override var description: String {
        get {
            return ("\(self.value) of \(self.color) ")
        }
        set {
            
        }
    }
    
    override func isEqual(_ object: Any?) -> Bool {
        let card = object as? Card
        return self.color == card?.color && self.value == card?.value
    }
    
    init(Color color:Color, Value value:Value) {
        self.color = color
        self.value = value
    }
}

func == (card1:Card, card2:Card) -> Bool {
    return (card1.color == card2.color && card1.value == card2.value)
}

//========================================

class Deck : NSObject  {
    
    
    static let allSpades: [Card] = Value.allValues.map ({
        Card(Color: Color.Spade, Value: $0)
    })
    
    static let allClubs:[Card] = Value.allValues.map ({
        Card(Color: Color.Club, Value: $0)
    })
    static let allDiamonds:[Card] = Value.allValues.map ({
        Card(Color: Color.Diamond, Value: $0)
    })
    static let allHearts:[Card] = Value.allValues.map ({
        Card(Color: Color.Heart, Value: $0)
    })
    
    static let allCards:[Card] =  allSpades + allClubs + allDiamonds + allHearts
    
    var cards: [Card] = Deck.allCards
    var discards: [Card] = []
    
//    let card0 = Card(Color: Color.Spade, Value: Value.Ace)
    var outs: [Card] = []
    
    init(isShuffled: Bool)                  //constructor
    {
        if !isShuffled
        {
            self.cards = self.cards.shuffle()
        }
    }
    
    override var description: String {      //override description
        get {
            return ("\(cards) ")
        }
        set {
            
        }
    }
    
    //===========fonction first ===============
    func first() -> Card? {
        return(cards[1])
    }
    
    //===========fonction draw ===============
    func draw() -> Card? {
        var fc: Card?
        fc = self.cards.first
        if (fc != nil)
        {
            self.outs.append(fc!)
            self.cards.removeFirst()
        }
        return fc
    }

    func fold(c : Card) {
        if (self.outs.contains(c))
        {
            self.discards.append(c)
            self.outs.remove(at: self.outs.index(of: c)!)
        }
    }
}



//========================================


extension Array {
    func shuffle() -> [Element] {
        var elem = self
        for i in indices // index : -> taille du tableau
        {
            let random = Int(arc4random_uniform(UInt32(elem.count)))
            if i != random
            {
                let tmp = elem[i]
                elem[i] =  elem[random]
                elem[random] = tmp
            }
        }
        return elem
    }
}



//print(Deck.allCards)
//print(Deck.allSpades)
//print(Deck.allClubs)
//print(Deck.allDiamonds)
//print(Deck.allHearts)
//
var tab = [1, 3, 4, 6, 8]
print(tab.shuffle())
//
//print("=============================\n")
//let card3 = Card(Color: Color.Spade, Value: Value.Ace)
//print(card3)
//

//
//print(card3 == card4)
//print(card3.isEqual(card4))

print(Deck.allCards)
var chtulu = Deck(isShuffled: false)
print(chtulu)
//print(chtulu.first()!)
print(chtulu.draw()!)

//print("=============================\n")

let card4 = Card(Color: Color.Spade, Value: Value.Ace)
print(card4)
print(chtulu.fold(c: card4))

let t = Deck(isShuffled: true)

print(t)
for i in 0..<52 {
    print(t.draw()!)
}

print(t.outs)

let card = Card(Color: Color.Spade, Value: Value.Two)

t.fold(c: card)
print(t.discards)
