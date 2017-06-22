// =========Fichier de test : compiler avec => swiftc *.swift

for col in Color.allColors {
    print("\(col) : \(col.rawValue)")
}

for val in Value.allValues {
    print("\(val) : \(val.rawValue)")
}



print("=============================\n")
let card1 = Card(Color: Color.Spade, Value: Value.Ace)
print(card1)

let card2 = Card(Color: Color.Diamond, Value: Value.Two)
print(card2)
print("=============================\n")

print(card1 == card2)
print(card1.isEqual(card2))

print("=============================\n")
let card3 = Card(Color: Color.Spade, Value: Value.Ace)
print(card3)

let card4 = Card(Color: Color.Spade, Value: Value.Ace)
print(card4)
print("=============================\n")

print(card3 == card4)
print(card3.isEqual(card4))


print("\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\n")

print(Deck.allCards)
print(Deck.allSpades)
print(Deck.allClubs)
print(Deck.allDiamonds)
print(Deck.allHearts)

print("_______________________________n")

var tab = [1,2,3,4,5,6,7,8,9]
print(tab)

print(tab.shuffle())
