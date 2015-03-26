// Playground - noun: a place where people can play

var section = "PROTOCOLS"

protocol SimpleProtocol {
    var simpleDescription : String {get}
    
    mutating func adjust () // mutating required for structs
}

class ProtoTestClass: SimpleProtocol {
    
    var simpleDescription:String = "protoTestClass "
    
    var someOtherProperty: Int = 95
    
    func adjust() {
        someOtherProperty = 100
        simpleDescription += " with \(someOtherProperty) adjustment applied"
    }
}

// test protocol compliance
var testProtocolObject: SimpleProtocol = ProtoTestClass()
testProtocolObject.simpleDescription
testProtocolObject.adjust()
testProtocolObject.simpleDescription


// Structs that comply with protocols and have something that modifies data have mutating keyword

struct ProtoTestStruct: SimpleProtocol {
    var simpleDescription: String = "protoTestStruct"
    
    mutating func adjust() {
        simpleDescription += " with no adjustment"
    }
}

var testProtocolStructInstance = ProtoTestStruct ()
testProtocolStructInstance.simpleDescription
testProtocolStructInstance.adjust()
testProtocolStructInstance.simpleDescription

// Enumeration that conforms to this protocol
enum ProtoTestEnum : SimpleProtocol {
    case first, second
    
    
    // enums cannot have stored properties
    var simpleDescription: String {
        get {
            switch self {
            case .first:
                return "first"
            case .second:
                return "second"
            }
        }
        set {
            simpleDescription=newValue
        }
    }
    
    mutating func adjust() {
        simpleDescription += " is adjusted"
    }
}

var testProtoEnum = ProtoTestEnum.second
testProtoEnum.simpleDescription
//testProtoEnum.adjust()
//testProtoEnum.simpleDescription   // not really sure how this is working
// probably need to have associated values for this to work correctly


section = "EXTENSIONS"

extension Int: SimpleProtocol {
    var simpleDescription: String {
        return "The number is: \(self)"
    }
    
    mutating func adjust() {
        self += 42
    }
}

var testInt = 7
testInt.simpleDescription
testInt.adjust()
testInt.simpleDescription


//protocols can be treated as types, in which case the methods of the class/struct are not available (only what is supported by the protocol)

section = "GENERICS"

func printMultipleTimes<Item>(item: Item, times: Int) {
    for i in 0..<times {
        println("\(item)")
    }
}

printMultipleTimes("blah", 3)

// generics are templates. Can be for functions, methods, classes, enums and structs
// can use where clause to have additional criteria (for example, particular super class, protocol, etc.)




