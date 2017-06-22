
var tab = [1, 3, 4, 6, 8]
print(tab.shuffle())
//print("=============================\n")


print(Deck.allCards)
var chtulu = Deck(isShuffled: false)
print(chtulu)
//print(chtulu.first()!)
print(chtulu.draw()!)

//print("=============================\n")
//==========rien dans le out==============
let card4 = Card(Color: Color.Spade, Value: Value.Ace)
print(card4)
print(chtulu.fold(c: card4))

//=======on melange le deck============
let t = Deck(isShuffled: true)
print(t)
//==========on pioche tout=========(52 max)
for i in 0..<52 {
    print(t.draw()!)
}

//============on affiche les outs ===========
print(t.outs)

let card = Card(Color: Color.Spade, Value: Value.Two)
//==on cherche l'as de trefle
t.fold(c: card)
print(t.discards)