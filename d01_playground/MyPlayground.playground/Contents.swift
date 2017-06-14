//: Playground - noun: a place where people can play

import Cocoa

/////////////////// var et let(const) //////////////////
var str = "Hello, playground"

let pi:Float = 3.14

/////////////////// tuple(plusieurs vaiables) //////////////////
let tuple = (str, pi)
print (tuple)

let anothertuple = ( tuple, str, pi)
print (anothertuple.1)

/////////////////// tableau //////////////////
var fruits:[String] = [String]()//ca construit un tableau vide
fruits.append("0 fraise")
fruits.append("1 cerise")
fruits.append("2 pommes")
//var fruits = ["1 fraise", "2 cerise","3 pommes"]
print (fruits[2])


/////////////////// dictionnaire //////////////////
var pers = [String : Int]()//ca construit un tableau vide
pers["jean"] = 21
pers["paul"] = 34
pers["marie"] = 56

//print (pers["paul"])


/////////////////// optionnal //////////////////

var optInt: Int? = 3   // ? signifie que c'est optionnel
                       // c'est dabord une optionnal, puis un int
//print(optInt)          // permet de savoir s'il y en a'
print(optInt!)         // !   unwrapper : oblige a recupere la valeur a l'interieur


var optString: String! = "coucou"   // ! signifie que c'est optionnel, avec une valeur           c'est dabord une optionnal, puis un string
print(optString)
print(optString!)  // !   unwrapper : oblige a recupere la valeur a l'interieur


//=============== if let ================

var optInt1: Int? = 4
//optInt1 = nil
if let number = optInt1 {
    print(number)
}



///////////////// weak //////////////

//var button: UIButton? = UIButton()
//CFGetRetainCount(button)
//
//weak var ButtonRef = button
//
//CFGetRetainCount(button)

// weak // definii une varaible mais ne va pas augmenter le nombre de reference sur le boutton


//===========================================================
//                     classes
//===========================================================



class PointClass {
    var x: Double
    var y: Double

    init (x:Double, y:Double) {    // declaration du constructeur avec INIT
        self.x = x                 // self objet courant
        self.y = y
    }
    
    func makeOrigin() {
        x = 0
        y = 0
    }
    
    func toString() -> String {
        return "\(x) \(y)"
    }
}

//================ extension ==================

extension PointClass {
    func toString1() -> String {
        return "\(x) \(y)"
    }
}



//==========================================

//struc : par la valeur
//class : par les references
struct pt {
    var x: Double
    var y: Double
    
    mutating func makeOrigin() {                     	// MURATING pour changer les ppte des fct
        x = 0
        y = 0
    }
}

//var p1 = pt(x:21, y:42)
var p1 = PointClass(x:21, y:42)
var p2 = p1
print(p1.toString1())
p1.x = 0
print(p1.toString1())

//====================================
// inherence, override, overload

//override : on reecrit une fonction precedement heriter
class Point : PointClass {
    override func toString() -> String {
        return "(x: \(x), y : \(y))"
    }
}
//overload : meme function mais differnce avec les parametres





enum Traffic {
    case Rouge
    case Orange
    case Vert
}
let lumiere = Traffic.Orange
lumiere.hashValue

//=======================================================

class Animal {
    var numberOfLegs = 0
}

class Dog : Animal  {
    override init() {
        super.init()				//super  :superieur : class parent
        numberOfLegs = 4
    }
    
    func bark() {
        print("ouaf")
    }
    
}

class Bird : Animal {
    override init() {
        super.init()				//super  :superieur : class parent
        numberOfLegs = 2
    }
    
    func fly() {
        print("fly")
    }
    
}


//=======================
var animals = [Animal]()
animals.append(Dog())
animals.append(Bird())
animals.append(Dog())
animals.append(Bird())

for animal in animals {
    if animal is Dog {
        print ("its a dog")
        let dog =  animal as! Dog;	//				as! 		force le cast
        dog.bark()
    }
    else if animal is Bird {
        print ("its a bird")
    }
    else {
        print ("its ??")
    }
    let bird = animal as? Bird
    bird?.fly()
}

