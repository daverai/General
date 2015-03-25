// Second part of the swift overview playground


var section = "FUNCTIONS AND CLOSURES"

// basic declaration of functions func <name> (param1 : type, param2: type) -> retValue
func greet(name: String, day: String) -> String {
    return "Hello " + name + ", Happy " + day
}

greet("Bob", "Friday")



// function using tuples
func stats (scores: [Int]) -> (min: Int, max: Int, sum: Int){
    

// code causes range error if no check done, not sure how to return nils
    //    if scores.count==0 {
//        return (0,0,0)
//    }
    
    var min = scores [0]
    var max = scores [0]
    var sum = scores [0]
    
    for currentScore in scores {
        if currentScore > max {
            max = currentScore
        } else if currentScore < min {
            min = currentScore
        }
        sum += currentScore
    }
    return (min, max, sum)
}

let statData = stats ([0, 5, 0, 5, 10])

statData.min
statData.max
statData.sum

// statement below causes an out of range error
// let statData2 = stats([])

// TODO: How to return a set of nils from the function if an error condition is met (optionals)


// functions can take a variable number of arguments

func avgCalc (numbers: Int...) -> Double {
    var sum = 0
    
    for num in numbers {
        sum += num
    }
    return Double (sum)/Double (numbers.count)
}

avgCalc() //produces not a number

avgCalc(1, 6, 8, 15, 3) //example usage



// functions can be a type (bit of a contrived example)

func incrementer(incValue: Int) -> (Int->Int) {
   func incByOne (number: Int) -> Int {
        return number + 1
    }
    
    func incByTwo (number: Int) -> Int {
        return number + 2
    }
    
    if incValue == 1
    {
        return incByOne
    }
    return incByOne
}

var increment = incrementer (1)
increment (8)
increment = incrementer(4)
increment (10)


//Examples of functions as arguements
//another bit of a contrived example

func resultGreaterThan15 (list: [Int], operation: ([Int]) -> Int?) -> Bool {
    var opResult: Int?  = operation (list)
    if opResult == nil {
        return false
    }
    return (opResult>15)
}

func maximumNumber (list: [Int]) -> Int? {
    if list.count == 0 {
        return nil
    }
    var max = list [0]
    for num in list {
        if num > max {
            max = num
        }
    }
    return max
}

func minimumNumber (list: [Int]) -> Int? {
    if list.count == 0 {
        return nil
    }
    var min = list [0]
    for num in list {
        if num < min {
            min = num
        }
    }
    return min
}

// test of functionality
resultGreaterThan15([15, 0, 3], maximumNumber)
resultGreaterThan15([16, 20, 30], minimumNumber)


section = "CLOSURES"

var numbers = [20, 10, 4, 6]

numbers.map ({
    (number: Int) -> Int in
    let result = 3 * number
    return result
})

// this is a way of writing enclosures more concisely - when the type of the enclosure is already known, the type of the prameters or return type (or both) can be omitted
let mappedNumbers = numbers.map({number in 3 * number})
mappedNumbers

// even more concise $0 and $1 are arguments, with the type inferred
// putting the closure at the end and outside of parens can be done of the closure is the last argument to the function

let sortedNumbers = sorted(numbers) {$0 > $1}
sortedNumbers
