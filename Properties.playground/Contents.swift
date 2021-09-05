import UIKit

//MARK:- Property observer

struct Bank1{
    var accountBalance: Double{
        didSet{    //after
            sendMsg()
        }
        willSet (newAccBal){   //before setting value
            print("new acc bal = \(newAccBal)")
        }
    }
    
    
    mutating func addMoney(amount: Double){
        accountBalance += amount
    }
    
    mutating func withdrawMoney(amount: Double){
        accountBalance -= amount
    }
    
    func sendMsg(){
        print("\(accountBalance)")
    }
    
    func sendMsgToAuditor(){
        print("Please check transaction")
    }
    
}

var bank = Bank1(accountBalance: 10000)
bank.addMoney(amount: 5000)

//class Bank{
//    var accountBalance: Double{
//        didSet{    //after
//            sendMsg()
//        }
//        willSet (newAccBal){   //before setting value
//            if(newAccBal >= 1000000){
//                sendMsgToAuditor()
//            }
//        }
//    }
//
//    init(_openingBal: Double){
//        accountBalance = _openingBal
//
//    }
//
//    func addMoney(amount: Double){
//        accountBalance += amount
//    }
//
//    func withdrawMoney(amount: Double){
//        accountBalance -= amount
//    }
//
//    func sendMsg(){
//        print("\(accountBalance)")
//    }
//
//    func sendMsgToAuditor(){
//        print("Please check transaction")
//    }
//}
//
//let bank = Bank(_openingBal: 10000)
//bank.addMoney(amount: 5000)
//bank.withdrawMoney(amount: 500)
//bank.addMoney(amount: 5000000000)
//bank.withdrawMoney(amount: 50000000)


//MARK:- Computed Property   - assign code not value

struct LoanCalculator
{
    var loanAmount: Int
    var rateOfInterest: Int
    var year: Int
    var simpleInterest: Int
    {
        get
        {
            return (loanAmount * rateOfInterest * year) / 100
        }
    }
}

let loanCalculator = LoanCalculator(loanAmount: 500000, rateOfInterest: 10, year: 5)
debugPrint("Interest amount = \(loanCalculator.simpleInterest)")

struct Circle
{
    var radius: Double = 0
    var area: Double
    {
        get
        {
            return radius * radius * Double.pi
        }

        set
        {
            radius = sqrt(newValue / Double.pi)
        }
///                            or
//        set(areaValue)
//        {
//            radius = sqrt(areaValue / Double.pi)
//        }
    }
}

var circle = Circle()
circle.radius = 5
debugPrint("area = \(circle.area)")

circle.area = 40
debugPrint("radius = \(circle.radius)")


//MARK:-  Property wrapper

//extension String
//{
//    func isValidEmail(email: String) -> Bool {
//        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-za-z]{2,64}"
//        let pred = NSPredicate(format: "SELF MATCHES %@", regex)
//        return pred.evaluate(with: email)
//    }
//}

@propertyWrapper                  //use with struct, enum,class
struct EmailPropertyWrapper
{
    private var _value: String
    var wrappedValue: String
    {
        get
        {
            return isValidEmail(email: _value) ? _value : String()
        }
        set
        {
            _value = newValue
        }
    }

    init(_emailValue: String) {
        _value = _emailValue
    }

    private func isValidEmail(email: String) -> Bool {
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-za-z]{2,64}"
        let pred = NSPredicate(format: "SELF MATCHES %@", regex)
        return pred.evaluate(with: email)
    }
}

struct Employee
{
    @EmailPropertyWrapper var employeeEmailId: String
}

struct User
{
    var name: String
    @EmailPropertyWrapper var email: String

    func validate() -> Bool
    {
        if(name.isEmpty || email.isEmpty)
        {
            debugPrint("name and a valid email is required and cannot be empty")
            return false
        }
        return true
    }

    func registerUser()
    {
        if(validate())
        {
            //saving user records code...
            debugPrint("User data saved")
        }
    }
}

let user = User(name: "abc", email: EmailPropertyWrapper(_emailValue:"abc@gmail.com"))
user.registerUser()


//MARK:- lazy stored property

//use when? - system memory

//lazy property is only assigned value once & not thread safe


struct ComplexTask{
    static var valueFirstEle: Int = 1
    static var result: Int = 0
    
    static func doComplexTask() -> Int{
        var task:[Int] = []
        for i in valueFirstEle...5000{
            task.append(i)
        }
        result = task.first!
        return result
    }
}

//struct Employeee{
//    var complexTask: Int {
//        ComplexTask.doComplexTask()
//    }
//}

struct Employeee{
    lazy var complexTask: Int = {
        ComplexTask.doComplexTask()
    }()
}


var objEmp = Employeee()
objEmp.complexTask

ComplexTask.valueFirstEle = 100
objEmp.complexTask
