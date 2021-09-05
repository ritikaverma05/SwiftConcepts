import UIKit


var myVariable: Int = 7
myVariable = 50 + Int(3.0)
let myConstant = 42

var a: Double = 70

let label = "The width is "
let width = 94
let widthLabel = label + String(width)

let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit."

let str = """
 "there is df cv fnjnfj fvjfj "\(a)" fm vm
 ffff \(myVariable)"
 """

var b = ["a", "b", "c"]
b.append("d")
//print(b)

var colorCode = ["Red": "100", "Blue": "101", "Green": "102"] as [String : Any]
colorCode["pink"] = "105"
colorCode.sorted
print(colorCode)

let emptyArray: [String] = []
let emptyDictionary: [String: Float] = [:]

let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
//print(teamScore)

var optionalString: String? = "Hello"
//print(optionalString == nil)
// Prints "false"

var optionalName: String?
var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)"
}


let nickname: String? = "verma"
let fullName: String = "John Appleseed"
let informalGreeting = "Hi \(nickname ?? fullName)"

let vegetable = "black pepper"
switch vegetable {
case "celery":
    print("Add some raisins and make ants on a log.")
case "cucumber", "watercress":
    print("That would make a good tea sandwich.")
case let x where x.hasSuffix("pepper"):
    print("Is it a spicy \(x)?")
default:
    print("Everything tastes good in soup.")
}

let interestingNumbers = [
    "Prime": [2, 3, 5, 70, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largest = 0
for (_, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}
print(largest)


var n = 2
while n < 100 {
    n *= 2
}
//print(n)

var m = 2
repeat {
    m *= 2
} while m < 100
//print(m)

var total = 0
for i in 0..<4 {
    total += i
}
print(total)

func greet(_ person: String, day: String) -> String {
    return "Hello \(person), today is \(day)."
}
greet("Bob", day: "M<)day")

func greet(_ person: String, on day: String) -> String {
    return "Hello \(person), today is \(day)."
}
greet("John", on: "Wednesday")


func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0

    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }

    return (min, max, sum)
}
let statistics = calculateStatistics(scores: [5, 3, 100, 1, 9, 70])
//print(statistics.sum)
//print(statistics.0)


func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}
returnFifteen()


func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
increment(7)


func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) -> Bool {
    return number < 10
}
var numbers = [20, 19, 7, 12]
hasAnyMatches(list: numbers, condition: lessThanTen)


var an = [20, 19, 7, 12]
let d = an.map({ (n: Int) -> Int in
    let result = 3 * n
    return result
})

let mappedNumbers = an.map({ number in 3 * number })
//print(mappedNumbers)

let sortedNumbers = an.sorted { $1 > $0 }
print(sortedNumbers)


class Shape {
    var numberOfSides:Int? = nil
    var name: String

     init(name: String) {
            self.name = name
        }
    //Notice how self is used to distinguish the name property from the name argument to the initializer
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides ?? 0) sides."
    }
}

var shape = Shape(name: "")
//shape.numberOfSides = 7
var shapeDescription = shape.simpleDescription()


enum Rank: Int {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king

    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}
let ace = Rank.ace
let aceRawValue = ace.rawValue + 1
if let convertedRank = Rank(rawValue: 10) {
    let threeDescription = convertedRank.simpleDescription()
}

enum Suit {
    case spades, hearts, diamonds, clubs

    func simpleDescription() -> String {
        switch self {
        case .spades:
            return "spadesssss"
        case .hearts:
            return "heartsssss"
        case .diamonds:
            return "diamondssss"
        case .clubs:
            return "clubssssss"
        }
    }
}
let hearts = Suit.hearts
let heartsDescription = hearts.simpleDescription()



enum ServerResponse {
    case test
    case result(String, String)
    case failure(String)
}

let success = ServerResponse.result("6:00 am", "8:09 pm")
let failure = ServerResponse.failure("Out of cheese.")

switch success {
case .test:
    print("okay")
case let .result(sunrise, sunset):
    print("Sunrise is at \(sunrise) and sunset is at \(sunset).")
case let .failure(message):
    print("Failure...  \(message)")

}


struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}
let threeOfSpades = Card(rank: .four, suit: .hearts)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()


protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}

class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class."
    var anotherProperty: Int = 69105
    func adjust() {
        simpleDescription += "  Now 100% adjusted."
    }
}
var aa = SimpleClass()
aa.adjust()
let aDescription = aa.simpleDescription

struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure"
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}
var bb = SimpleStructure()
bb.adjust()
let bDescription = bb.simpleDescription


extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
}
//print(7.simpleDescription)

let protocolValue: ExampleProtocol = aa
//print(protocolValue.simpleDescription)


enum PrinterError: Error {
    case outOfPaper
    case noToner
    case onFire
}

func send(job: Int, toPrinter printerName: String) throws -> String {
    if printerName == "Never Has Toner" {
        throw PrinterError.outOfPaper
    }
    return "Job sent"
}

do {
    let printerResponse = try send(job: 1440, toPrinter: "Never Has Toner")
    print(printerResponse)
} catch PrinterError.onFire {
    print("I'll just put this over here, with the rest of the fire.")
} catch let printerError as PrinterError {
    print("Printer error: \(printerError).")
} catch {
    print(error)
}


let printerSuccess = try? send(job: 1884, toPrinter: "Mergenthaler")
let printerFailure = try? send(job: 1885, toPrinter: "Never Has Toner")


var fridgeIsOpen = false
let fridgeContent = ["milk", "eggs", "leftovers"]

func fridgeContains(_ food: String) -> Bool {
    fridgeIsOpen = true
    defer {
        fridgeIsOpen = false
    }

    let result = fridgeContent.contains(food)
    return result
}
fridgeContains("banana")
//print(fridgeIsOpen)

func makeArray<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
    var result: [Item] = []
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    return result
}
makeArray(repeating: "knock", numberOfTimes: 4)

// Reimplement the Swift standard library's optional type
enum OptionalValue<Wrapped> {
    case none
    case some(Wrapped)
}
var possibleInteger: OptionalValue<Int> = .none
possibleInteger = .some(100)

func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool
    where T.Element: Equatable, T.Element == U.Element
{
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }
    return false
}
anyCommonElements([1, 2, 3], [4])


extension Double {
    func absoluteValue() -> Double {
        if self < 0 {
            return -self
        } else {
            return self
        }
    }
}

let myDouble: Double = -7.65
print("The absolute value of \(myDouble) is \(myDouble.absoluteValue()).")
