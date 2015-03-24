// Playground - noun: a place where people can play

import UIKit

var section = "CONSTANTS, VARIABLES AND TYPES"

//constants must have same type as value assigned to it
//can be inferred from the value or specified explicitly by use of colon

let implicitInt=70

let explicitDouble: Double=70
let explicitFloat: Float=4


//values never have implicit type conversion 
//if type conversion is required, need to make an instance of the desired type
//var noImplicitConversion: Float = explicitDouble
//var noImplicitConversionDouble: Double = explicitFloat

//correct example
var explicitConversionToFloat: Float = Float(explicitDouble)

//String example of type conversion
let label = "The width is: "
let width = 94
let widthLabel = label + String(width)

//simpler way of doing printing
let apples = 3, oranges = 5
let fruitSummary = "I have \(apples) apples and \(oranges) oranges"


section = "ARRAYS AND DICTIONARIES"

// constant array
let numberList = [1,2,3]

// variable list
var shoppingList = ["pen", "pencil", "eraser"]

// this won't work because it is constant: 
//numberList[1] = 3
numberList[2]  // reading is fine

shoppingList [2] // reading from array
shoppingList[2] = "ruler"
shoppingList

var occupations = [
    "person 1": "captain",
    "bruce": "policeman",
    "will": "actor"
]

occupations ["bruce"] // printing lookup
occupations ["person 1"] = "unknown"
occupations


// declaring empty arrays unsing initializer
let emptyStrArray = [String]()
var emptyVarStrArray = [String]()

//emptyStrArray.append("blah") - does not work since the array is immutable
emptyVarStrArray.append("blah")
emptyVarStrArray += ["blee", "1", "2"]
emptyVarStrArray.count
emptyVarStrArray.splice(["inserted 1", "inserted 2"], atIndex: 1)
emptyVarStrArray.count


section="OPTIONALS"

var optionalString: String? = "Hello"
//section == nil //- this can't be done since section is not an optional
optionalString = nil   // is OK since it is an optional

if let greeting = optionalString {  //greeting is only assigned if optionalString contains a non-nil value
    println("The greeting is: " + greeting)
}


section = "SWITCH STATEMENT"

switch section {
    case "SWITCH STATEMENT":
        let comment = "in switch statement section"
    case "Other":
        let comment = "in other section"
default:
    let comment = "NO MATCH"
    
}


section = "LOOPS"
// loop with index
var firstForLoop = 0
for i in 0..<4 {
    firstForLoop += i
}
firstForLoop





