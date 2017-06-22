import Foundation

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

