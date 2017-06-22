// =========Fichier de test : compiler avec => swiftc Color.swift Value.swift main.swift Card.swift

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