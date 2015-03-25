// Playground - noun: a place where people can play


var section = "OBJECTS AND CLASSES"


// example declaration of a class and associated properties and functions
class Shape {
    
    // properties
    var numberOfSides=0
    //example of constant property
    //let name="A Shape"
    
    // changed to be set at initialization
    var name: String
    
    // iniitalizer
    init (name: String) {
        self.name = name
    }
    
    
    // class functions
    func simpleDescription() -> String {
        return "A shapem with \(numberOfSides) sides"
    }
    
    // deinitializer is created using deinit if a class has to do cleanup
}

var theShape = Shape(name:"myshape")

theShape.numberOfSides=7
theShape.name




// example of subclassing

class Square: Shape {
    
    var sideLength: Double

    // example of a computed property - actual computation done in initializer
    let area2: Double
    
    init (sideLength: Double, name: String) {
        // own properties must be initialized before super.init call
        self.sideLength=sideLength
        area2=sideLength*sideLength
        
        super.init(name: name)
        numberOfSides = 4
    }
    
    // additional func
    func area () -> Double {
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "A square with sides of lenght \(sideLength)"
    }
}

let test=Square (sideLength: 4.0, name: "MySquare")

test.area()
test.area2
test.simpleDescription()
test.numberOfSides


// second exmaple of subclassing

class Circle: Shape {
    
    var radius: Double
    let area: Double
    
    init(radius: Double, name: String) {
        self.radius=radius
        area=3.14*radius*radius
        
        super.init(name: name)
    }
    override func simpleDescription() -> String {
        return "A circle with radius \(radius)"
    }
}

var testCircle = Circle (radius: 4.2, name: "My Circle")
testCircle.area
testCircle.simpleDescription()

// Example of properties with getters and setters

class EquilateralTriangle: Shape {
    
    var sideLength: Double
    
    // iniitalizer - has 3 steps
    // set value of own properties
    // call superclass initializer
    // set values of superclass properties and then any other setup work that uses methods, getters or setters
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        
        super.init(name: name)
        
        numberOfSides=3
    }
    
    // getter and setter for permiiter property
    var permiter: Double {
        get {
            return sideLength*3
        }
        
        set {
            sideLength = newValue/3.0
        }
    }
    
    override func simpleDescription() -> String {
        return "A triangle with 3 equal sides of lenght \(sideLength)"
    }
}


var testTriangle = EquilateralTriangle (sideLength: 4, name: "My Triangle")
testTriangle.permiter
testTriangle.permiter=15
testTriangle.sideLength
testTriangle.simpleDescription()


// Example of properties with willSet and didSet
// everytime the square or triangle is changed, the code inside willSet is run

class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    
    var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    
    init (size: Double, name:String) {
        square = Square (sideLength: size, name: name)
        triangle = EquilateralTriangle (sideLength: size, name: name)
    }
}

var triangleAndSquare = TriangleAndSquare (size: 10, name: "Balh")

triangleAndSquare.square.sideLength
triangleAndSquare.triangle.sideLength

triangleAndSquare.square=Square (sideLength: 50, name: "Bigger")
triangleAndSquare.triangle.sideLength

// methods on classes are different than functions
// parameter names are used when you call methods and parameter names used inside the method can be different

class Counter {
    var count: Int = 0
    
    func incrementBy (amount: Int, numberOfTimes times:Int) {
        count += amount * times //example of parameter named different from caller to inside function
    }
}

var counter = Counter ()
counter.incrementBy(2, numberOfTimes: 7) //first paramter never has to be named

section = "OPTIONAL VALUES"

// for optional values, can write ? in front of opertaions (methods, properties, and subscripting)
// if value is nil, everything after ? is ignored
// otherwise, the value is unwrapped and everything else acts on the unwrapped value
// value of the whole expression is an optional value

let optionalSquare: Square? = Square (sideLength: 4.0, name: "Optional Square")
let sideLength = optionalSquare?.sideLength

section = "ENUMERATIONS AND STRUCTURES"

// Enumerations can have methods like all other named types and classes
enum Rank: Int {
    case Ace = 1
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King
    
    func simpleDescription () -> String {
        switch self {
        case .Ace:
            return "Ace"
        case .Jack:
            return "Jack"
        case .Queen:
            return "Queen"
        case .King:
            return "King"
        default:
            return String (self.rawValue)
        }
    }
    
    // returns the higher raw value card
    func compare (otherCard: Rank) -> Rank {
        if (otherCard.rawValue > self.rawValue) {
            return otherCard
        }
        return self
    }
}


let ace=Rank.Ace
ace.rawValue
ace.simpleDescription()
let card=Rank.Ten
card.simpleDescription()

card.compare(ace).rawValue
let anotherCard=Rank.Jack
card.compare(anotherCard).rawValue

// example of getting enumeration from raw value
var someOtherCard = Rank (rawValue: 13)
someOtherCard?.simpleDescription()


// Some enumeration types may not have meaningful raw values
enum Suit {
    case Spades, Hearts, Diamonds, Clubs
    
    func simpleDescription () -> String {
        switch self {
        case .Spades:
            return "Spades"
        case .Clubs:
            return  "Clubs"
        case .Diamonds:
            return "Diamonds"
        case .Hearts:
            return "Hearts"
        }
    }
    
    func colour () -> String {
        switch self {
        case .Spades, .Clubs:
            return "Black"
        case .Diamonds, .Hearts:
            return "Red"
        }
    }
}

let someSuite = Suit.Hearts
someSuite.simpleDescription()
someSuite.colour()


// Structures are almost like classes
// Important difference: structures are copied and classes are always passed by reference

struct Card {
    var rank: Rank
    var suit: Suit
    
    func simpleDescription () -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
    
    // no easy way of going through enumeration values
    func createFullDeck () -> [Card] {
        var deck = [Card]()
        
        for currentRank in Rank.Ace.rawValue ... Rank.King.rawValue {
            for currentSuit in [Suit.Hearts, Suit.Spades, Suit.Clubs, Suit.Diamonds] {
                let newCard = Card (rank: Rank(rawValue: currentRank)!, suit: currentSuit)
                deck.append (newCard)
            }
        }
        return deck
    }
}

let aCard = Card(rank: .Jack, suit: .Diamonds)
aCard.simpleDescription()

let testDeck = aCard.createFullDeck()
testDeck.count

for deckCard in testDeck {
    deckCard.simpleDescription()
}


