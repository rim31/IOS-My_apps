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