import UIKit


//MARK:- function

class MyClass{
    
    func printUSerNAme(name: String = "Xcode") -> String {
        return name
    }
    
    func minAndmanValues(array: [Int]) -> (min: Int, Max: Int){
    
        if(array.isEmpty){return (0,0)}
        var currentMin = array[0]
        var currentMax = array[0]
        
        for value in array[1..<array.count]{
            if value < currentMin{
                currentMin = value
            }else if value > currentMax{
                currentMax = value
            }
        }
        
        return (currentMin, currentMax)
    }
}


var obj1 = MyClass()
let result1 = obj1.minAndmanValues(array: [0,4,5,-1])


//MARK:- structure - valueType

struct User{
    var name: String
    var age: Int
    
    func printUserInfo() -> String{
        return ("\(name) \(age)")
    }

}

var result = User(name: "Ritika", age: 20)
var user2 = result
result.printUserInfo()
user2.printUserInfo()
user2.name = "Verma"
user2.age = 40
user2.printUserInfo()
result.printUserInfo()


//MARK:- classes - ReferenceType

class cal{
    
    var index: Int
    init(userIndexValue: Int) {
        index = userIndexValue
    }
    func add(first: Int, second: Int) -> Int{
        return first+second
    }
    func sub(first: Int, second: Int) -> Int{
        return first-second
    }
}

let obj = cal(userIndexValue: 10)
obj.add(first: 10, second: 20)
obj.sub(first: 100, second: 20)


class emp{
    var empID: Int = 1
    var department: String = "Technical"
}


let objEmployee = emp() //Memory address = 1234
objEmployee.department

var objEmp2 = objEmployee ///Memory adress
objEmp2.department = "Mecanical"
objEmployee.department

//MARK:- Optionals and Required

class Person{
    var first: String = String()
    var middle: String?
    var last: String = String()
    
    func printName() -> () {
        
        if(middle != nil){
//            print("\(first) \(middle!) \(last)")
        }
        else{
//            print("\(first) \(last)")
        }
    }
}

let objP = Person()
objP.first = "Ritika"
objP.middle = "B"
objP.last = "Verma"
objP.printName()


//MARK:- Closures

typealias ADDNum = (_ first: Int, _ second: Int) -> Int

let add : ADDNum = {
    (_ first: Int, _ second: Int) -> Int in
    return first + second
}

add(1,2)

var addition:(Int, Int) -> Int = {
//    (number1, number2) in
//    return number1+number2
    return $0 + $1
}

let resultAdd = addition(10, 20)

///autoclosure

//MARK:- Dictionary

//var carDictionary: [String: Any] = ["Key": "Value"]

var carDictionary: [String: String] = ["Audi": "RB", "Nissan": "Rogue", "BMW": "X3"]
if(carDictionary["ABC"] != nil){
//    print(carDictionary["ABC"]!)
}else{
//    print("No such keys")
}
carDictionary["Audi"] = "A4"
var carD2 = carDictionary
carD2["Audi"] = "A5"


//MARK:- Extensions
 
//MARK:- Sets

var color1: Set<String> = ["R", "B", "Y", "B"]
var color2: Set<String> = ["Q", "E", "R", "R"]
color1.intersection(color2)
color1.symmetricDifference(color2)

var str:String = "code"
str.hashValue

var str2:String = "codeX"
str2.hashValue


struct Persons: Hashable{
    let age: Int
    let name: String
}

let objPS: Set<Persons> = [Persons(age: 30, name: "Code")]

//MARK:- Initializers

struct Item{
    let name: String
    let cost: Int
    let quantity: Int = 2
    
    init(name: String, cost: Int) {
        self.name = name
        self.cost = cost
    }
    
    
}

let objItem = Item(name: "macpro", cost: 50000)
objItem.cost

struct PErson{
    var uidai: String
    
    init?(personUIDAI: String) {
        
        if(personUIDAI.count < 12){
            return nil
        }
        self.uidai = personUIDAI
    }
}

let objPU = PErson(personUIDAI: "111100088888")
objPU?.uidai


//MARK:- Generic

func genericAdd<R:Strideable>(number: R) -> R {
    return number.advanced(by: 1)
}
genericAdd(number: 3)
genericAdd(number: 3.0)

//MARK:- Guards

func display(name: String?){
    
//    assert(name != nil)
    
//    if name != nil{
//        print("\(name!)")
//    }else{
//        print("empty")
//    }
    
//    guard name != nil else {
//        print("empty")
//        return
//    }
//    print("\(name!)")
}

display(name: "ritika")

//MARK:- optional binding and optional chaning

struct Parts {
    let name: String?
    let price: Double?
}

class ComputerParts {
    
    func findParts(name: String) -> Parts? {
        
        if(name == "keyboard"){
            return Parts(name: "k2", price: 800)
        }else if (name == "mouse"){
            return Parts(name: "k3", price: 400)
        }
        return nil
    }
}

let objComp = ComputerParts()

if let parts = objComp.findParts(name: "keyboard"){
    if let partPrice = parts.price{
//        debugPrint(partPrice)
    }
}


if let partPrice = objComp.findParts(name: "card")?.price{
//        debugPrint(partPrice)
}else{
//    debugPrint("no parts found")
}


//MARK:- Error handling

enum BikeError : Error{
    case inSufficientPetrolQuantity(neededQuan: Int)
    case inSufficientAge(neededAge: Int)
}

struct Bike{
    
    func startPic(quan: Int) throws -> String{
        
        if quan < 4{
            throw BikeError.inSufficientPetrolQuantity(neededQuan: 4)
        }
        return "lets start"
    }
    
    func startBike(age: Int) throws -> String{
        
        if age < 18{
            throw BikeError.inSufficientAge(neededAge: 18)
        }
        return "lets start"
    }
    
}

let objbike = Bike()

do {
    try objbike.startBike(age: 17)
} catch BikeError.inSufficientPetrolQuantity(let neededQuan){
//    debugPrint("error occured-\(neededQuan)")
} catch BikeError.inSufficientAge(let neededAge){
//    debugPrint("error occured-\(neededAge)")
}


//MARK:- inheritance

protocol A{
    func doSomething()
}

protocol B{
    func doSomething()
}

class Employee : A, B{
    
    func doSomething(){
        debugPrint("Dosomething")
    }
}

let empObj = Employee()
(empObj as B).doSomething()


//MARK:- ARC- Automatic reference counting

class Person1{
    var name: String
    
    init(_name: String) {
        debugPrint("init called")
        name = _name
    }
    
    func printNAme(){
        debugPrint("\(name)")
    }
    
    deinit {
        debugPrint("deinit called")
    }
}

var objP2: Person1?
var objP3: Person1?

if (1 == 1) {
    let objP1 = Person1(_name: "code")
    objP2 = objP1
    objP3 = objP1
    objP1.printNAme()
}

objP2 = nil
objP3 = nil


//MARK:- Protocol

protocol Product {
    
    associatedtype Code
    var productCode: Code { get }
    func description() -> String
}

struct laptop : Product {
    
    typealias Code = String
    var productCode: String

    func description() -> String {
        "This is laptop"
    }
}

struct KeyB : Product {
        
    typealias Code = Int
    var productCode: Int

    func description() -> String {
        "This is KEyb"
    }
}

struct Factory {
    
    func makeProducts() -> some Product{
        return laptop(productCode: "test")
    }
    
    func makeProducts() -> KeyB{
        return KeyB(productCode: 1)
    }
}


protocol Engine{
    func start()
    func stop()
}

protocol Safety{
    func applyBrakes()
}

protocol Car: Engine, Safety{
//    func speed()
}


class Rogue: Car{
    
    func applyBrakes() {
        print("Brakes applied")
    }
    
    func start() {
        print("Engine started")
    }
    
    func stop() {
        print("engine stopped")
    }
    
}
 
class Audi: Car{
    
    func applyBrakes() {
        print("Brakes applied 2")
    }
    
    func start() {
        print("Engine started 2")
    }

    func stop() {
        print("engine stopped 2")
    }

}

let objRouge = Rogue()
let objAudi = Audi()

//objRouge.applyBrakes()
//objAudi.applyBrakes()


class Personn{
    
    func drive(car: Car){
        car.start()
    }
}

let objPer = Personn()
objPer.drive(car: objAudi)

//optional protocol

//@objc protocol Tax{
//    func calTax()
//    @objc optional func PrintTaxInfo()
//}
//
//class Invoice : Tax{
//
//    func calTax() {
//        print("djhfbhjfv")
//    }
//
//}
//
//let objClass = Invoice()
//objClass.PrintTaxInfo?()
//

//extension protocol

protocol Tax{
    func calTax()
}

extension Tax{
    func PrintTaxInfo() {
        debugPrint("djhfEEEEbhjfv")
    }
}

struct Invoice : Tax{
    
    func calTax() {
        debugPrint("djhfbhjfv")
    }
    
}

let objClass = Invoice()
objClass.PrintTaxInfo()





//MARK:- higher order functions (input func and output func)

//map, compactmqp, flatmap, filter, reduce, removeAll, contains, sorted, split, forEach, allSatisfy, partition

//MAP

///-use with array and dic
///-map is used for data transformation
///-map{instructions}
///returns separate arrray as the result of transformation

let num : [Int] = [1,2,3,4]

func convertToString() -> [String]{
    var result : [String] = []
    for value in num {
        result.append(String(value))
    }
    return result
}


func convertUSingMap() -> [String]{
    return num.map{
        String($0)
    }
}


func multi(value: Int) -> [Int]{
    return num.map{($0 ?? 0) * value}
}

multi(value: 2)

///optional map

///avoid recursion (struct -compile time , class- compile time)


//MARK:- Any Object and Any

/// any - rep instance of any type, including func   -- {IBAction}, class + value type, Dictionaries use
/// anyobj - instance of class type, protocol to which all classes implicitly conforms, to declare protocol
           
//protocol LoginVCDelegate: class/AnyObject{
//    func didfininshBG(sender: LoginVC)
//}

var result2 : Any = 15
result2 = "hey"

//value can change easily


