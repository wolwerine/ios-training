//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"



//----- closures

let someArray = ["Z", "A", "C", "D"]

func sortFunc(_ s1:String, _ s2:String) -> Bool
{
    return s1 > s2
}

let sortedArray = someArray.sorted(by: sortFunc)

let sortedArray2 = someArray.sorted { (s1, s2) -> Bool in
    return s1 > s2
}
// shorthand argument names
let sortedArray3 = someArray.sorted {
    $0 > $1
}

let sortedArray4 = someArray.sorted(by: > )

// nested function
func makeIncrementer(forIncrement amount:Int) -> () -> Int{
    var total = 0
    
    func increment() -> Int {
        total += amount
        return total
    }
    
    return increment
}

let incrementByTen = makeIncrementer(forIncrement: 10)
let incrementBeOne = makeIncrementer(forIncrement: 1)
var val:Int = incrementByTen()
val = incrementByTen()
var val2 = incrementBeOne()
val2 = incrementByTen()


//------

var queuedCloseres: [() -> Void] = []
func queueClosure(_ closure: @escaping () -> Void) {
    queuedCloseres.append(closure)
}


queueClosure {
    print("Running1")
}

queueClosure {
    print("Running2")
}


for closure in queuedCloseres {
    closure
}


//----- error handling

enum PasswordError : Error {
    case empty
    case short(minChar: Int)
    case obviuos(message:String)
}

func encrypt(_ str:String, with password:String) throws -> String {
    
    if password == "12345" {
        throw PasswordError.obviuos(message: "Too easy")
    } else if password.characters.count < 5 {
        throw PasswordError.short(minChar: 5)
    } else if password.characters.count < 10 {
        throw PasswordError.short(minChar: 10)
    }
    
    
    let encrypt = password + str + password
    return String(encrypt.characters.reversed())
}


let enc1 = (try? encrypt("Secret", with: "12123112312312")) ?? "Failed"


do {
    let encrypted = try encrypt("RandomText", with: "123467")
    print(encrypted)
} catch PasswordError.short (let minChars) where minChars == 5{
    print("encryption failed: password too short! Minimum char number is \(minChars)")
} catch PasswordError.short (let minChars) where minChars == 10{
    print("encryption failed: password too short! Minimum char number is \(minChars)")
} catch PasswordError.obviuos {
    print("encryption failed: password too easy")
} catch PasswordError.empty {
    print("encryption failed")
}


//----- guard

func giveAccess(to name:String?) {
    guard let unwrappedName = name else {
        return
    }
    
    print("Do something with \(unwrappedName)!")
}

for i in 1...100 {
    guard i % 8 == 0 else { continue }
    print(i)
}


//----- type casting

class MediaItem { }
class Movie: MediaItem {
    var name = ""
    var director = ""
}
class Song: MediaItem {
    var name = ""
    var artist = ""
}

let library = [Movie(), Song(), Song(), Movie()]

var movieCount = 0
var songCount = 0

for item in library {
    if let movie = item as? Movie {
        movieCount += 1
        print("Movie: \(movie.director)")
    }else  if let song = item as? Song {
        songCount += 1
        print("Song: \(song.artist)")
    }
}


//----- extension

extension Double {
    var km1: Double { return self * 1000.0 }
    var m: Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1000.0 }
}

let mmeters = 25.4.mm


extension Int {
    enum Kind {
        case negative, zero, postive
    }
    
    var kind: Kind {
        switch self {
        case 0:
            return .zero
        case let x where x > 0:
            return .postive

        default:
            return .negative
        }
    }
    
    func repetitions(task:() -> Void ) {
        for _ in 0..<self {
            task()
        }
    }
}

print((-10).kind)

3.repetitions {
    print("helloooo")
}




//-----protocols

protocol SomeProtocol {
//    func something()
    
    var someProperty: Int { get set }
    static var someTypePorperty: String { get }
    
    func someMethod(parameter: Int) -> Bool
    static func someTypeFunc()
}

class SomeClass: SomeProtocol {
    
    static var someTypePorperty: String = ""
    
    func someMethod(parameter: Int) -> Bool {
        return true
    }
    
    static func someTypeFunc() {
        
    }
    
    var someProperty: Int {
        get {
            return 0
        }
        set {
            self.someProperty = newValue
        }
    }
    
}





protocol TextRepresentable {
    var textalDescription: String { get }
}

extension Int: TextRepresentable {
    var textalDescription: String {
        return "Description for \(self)"
    }
    
}

var data: [TextRepresentable] = [2, 4, 5]
for val in data {
    print(val.textalDescription)
}






protocol SomeClassOnlyProtocol: class {
    
}

class SomeStruct: SomeClassOnlyProtocol {
    
}




protocol SomeRandomProtocol {}
protocol OtherRandomProtocol {}

protocol ThirdProtocol: SomeRandomProtocol, OtherRandomProtocol {}

func someFunction(_ param: SomeRandomProtocol & OtherRandomProtocol) {
    // do something
}




protocol SomeStuffProtocol {
    var someProperty: String { get }
}

extension SomeStuffProtocol {
    var someProperty: String {
        return "asdasdas"
    }
}

extension Int:SomeStuffProtocol {}
print(5.someProperty)






protocol Describable {
    var description: String {get }
}

struct Product<T> {
    var attribute: T
}

extension Product where T:Describable{
    func printDescription() {
        print("Some description \(attribute.description)")
    }
    
}


struct WeightAttribute: Describable {
    var value: Int
    var description: String {
        return "description for weigth \(value) value"
    }
}

let thing = Product(attribute: WeightAttribute(value: 5))
thing.printDescription()





//------ tuple

let errorCode = (404, "Not found") // Tuple
let double = (value:4.14)
let someTuple: (value1: Int, value2: Double) = (value1:100, value2:3.14)
let tuple: (Int, Int, String) = (1, 300, "string")

//func returnSomething() -> (val1: Int, val2: Int) {
//    return (10, 3)
//}

func returnSomething() -> Void {
    return ()
}

let intTuple: (Int) = 1
let intValue: Int = (1)
let bool = intValue == intTuple



var sometuple = (val1: "value1", val2: "value2")
sometuple = (val1:"aaaa", val2:"dataaa")


var randomTuple = ("asdas", "dsadsadsa", (1, 2, "string"))
print(randomTuple.0)
print(randomTuple.1)
print(randomTuple.2.2)



var tupletuple = (value: "Some value", action: {
    (parameter: String) in
        print(parameter)
})

tupletuple.action("some data")



var tuple1 = (val1: "value1", val2: "value2")
var tuple2 = (val1: "value1", val2: "value2")

if tuple1 == tuple2 { print("equal") }



//----- Destructuring

let dataa = ("one", "two", 3)
let (_, _, three) = dataa
print(three)

//let (value1, value2) = (getOne(), getTwo())







let name = "John"
let passowrd = "123456"

let authentication = (name:"John", password: "123456", address:"Budapest")

switch authentication {
case ("John", "123456", "Budapest"):
    print("Hello, John")
case ("Maria", "none", _):   // _ is ignoring the third value
    print("Hello, Maria")
    
default:
    print("Hello, Stranger")
}



func devide3And5(number: Int) -> String {
    switch (number % 3 == 0, number % 5 == 0) {
    case (true, false):
        return ("three")
    case (false, true):
        return("five")
    case (true, true):
        return("three & five")
    case (false, false):
        return (String(number))
    }
}

print(devide3And5(number: 25))





let user1 = (name:"user1", pass:"pass")
let user2 = (name:"user2", pass:"passss")
let user3 = (name:"user3", pass:"pass")

let users = [user1, user2, user3]

for case let (name, "pass") in users {
    print(name)
}





let somename : String? = "username"
let somepassword : String? = "pass"

switch (somename, somepassword) {
case let (.some(matchedName), .some(matchedPassword)):
    print("hello \(matchedName)")
case let (.some(matchedName), .none):
    print("password???")
default:
    print("who are you???")
}

switch (somename, somepassword) {
case let (somename?, somepassword?):
    print("hello \(somename)")
case let (.some(matchedName), .none):
    print("password???")
default:
    print("who are you???")
}





let dataaa: [Any?] = ["Bill", nil, 69, "Ted"]
for case let .some(i) in dataaa {
    print(i)
}

for case let datum? in dataaa {
    print(datum)
}






enum WeatherType {
    case cloudy(coverage: Int)
    case sunny
    case windy
}

let forecast: [WeatherType] = [.cloudy(coverage: 15), .sunny, .windy]



let view : AnyObject = UIButton()

switch view {
case is UIButton:
    print("found a button")
default:
    print("some view")
}


//-----protocol oriented

protocol Payable {
    func calculateWages() -> Int
}

protocol ProvidesTreatment {
    func treat(name: String)
}

protocol ProvidesDiagnosis {
    func diagnose() -> String
}

protocol CoductsSurgery {
    func performSurgery()
}

protocol HasRestTime {
    func takeBreak()
}

protocol NeedsTraining {
    func study()
}

extension Payable {
    func calculateWages() -> Int {
        return 10000
    }
}

extension ProvidesTreatment {
    func treat(name: String) {
        print("i have treated \(name)")
    }
}


extension ProvidesDiagnosis {
    func diagnose() -> String {
        return "he is ok"
    }
}

extension HasRestTime {
    func takesBreak() {
        print("time to watch tv")
    }
}

extension NeedsTraining {
    func study() {
        print("i'm reading a book")
    }
}


struct Receptionist {}
struct Nurse {}
struct Doctor {}
struct Surgeon {}

protocol Employee : Payable, HasRestTime, NeedsTraining {}

extension Receptionist: Employee {}
extension Nurse : Employee ProvidesTreatment {}
extension Doctor : Employee, ProvidesTreatment, ProvidesDiagnosis {}
extension Surgeon: Employee, ProvidesDiagnosis, CoductsSurgery {}
