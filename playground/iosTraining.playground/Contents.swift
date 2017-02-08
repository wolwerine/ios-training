//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


let someConstant = 100
//someConstant = 10


let data: Float     // type annotation
data = 10.5         // delayed assignment

let someString = "The value is ", someValue = 10
let combined = someString + String(someValue)       // no implicit conversion


//---- String

let likeStatus = "like"
let swift = "I \(likeStatus) swift"

let quote = "\""
var swift2 = "I \( quote + likeStatus.uppercased() + quote) swift"

//---- Array

var a1 = [1,2,4]
var a2 = [4,6,6]

var a3 = a1 + a2


//---- Switch

let errorCode = 3
switch errorCode {
case 0:
    print("no error")
case 1...2:
    print("internal error")
case 3:
    print("communication errror")
    fallthrough
case 4:
    print("some error")
case 5:
    print("some other error")
default:
    print("unknown error")
    
}

//---- for

for i in 0...5 {
    print("\(i)")
}

for _ in 0..<5 {
    print("loop")
}

var somelooparray = ["one", "two"]
for val in somelooparray {
    print("value is \(val)")
}

//---- functions

func doSomethingWithNamedParameter(someName name:String){
    print(name)
}
doSomethingWithNamedParameter(someName: "asdasd")

func doSomethingWithoutLabelParameter(_ param:Int){
    print("\(param)")
}
doSomethingWithoutLabelParameter(5)


//----- optionals?

func ageFor(name: String) -> Int?
{
    if name == "Gicu" {
        return 15
    }
    if name == "Mircea" {
        return 10
    }
    
    return nil
}

if var unwrappedAge = ageFor(name:"Gicu"), let anotherUnwrappedAge = ageFor(name:"Mircea"), unwrappedAge > 10 && anotherUnwrappedAge > 15 {
    
    unwrappedAge += 10
    print("the age is \(unwrappedAge)")
    
    print("the age is \(anotherUnwrappedAge)")
    
} else {
    print("else")
}


//-----

let possibleValue : Int? = 10
let someData : String! = "force unwrap"
let someData2 : String? = "optional value"
print(someData)
print(someData2 ?? "default value")


//-----

let someDict : [String: [Int]] = ["key1" : [1, 2],
                                  "key2" : [3, 4]]

let getdata = someDict["key3"]?[0] // nil
let getdata2 = someDict["key2"]?[0]

//---- default

func nameFor(id:Int) -> String? {
    if (id == 100) {
        return "gicu"
    }
    
    return nil
}
let name:String = nameFor(id:400) ?? "unknown"


//----- 
var arrayTest = [Any]()
arrayTest.append("String")
arrayTest.append(12)

//-----

func nameForID(id:Int)->String?{
    if id == 100 { return "izeke" }
    
    return nil
}

let name1:String = (nameForID(id: 100)?.uppercased())!


//----- ENUM

enum Color:String {
    case White
    case Black = "Fekete"
    case Unknown
    
    var description:String
        {
        switch self {
        case .White:
            return "color is white"
        case .Black:
            return "color is black"
        default:
            return "color unknown"
        }
    }
    
    func otherDescription(_ header:String) -> String {
        return header + " Description"
    }
}

enum SomeEnum {
    case Val1, Val2, Val3
}

var myFavouriteColor = Color.White
myFavouriteColor = .Black
print(myFavouriteColor)
print(myFavouriteColor.rawValue)
print(myFavouriteColor.description)
print(myFavouriteColor.otherDescription("2:"))

var blackColor = Color(rawValue: "Fekete")
print(blackColor ?? "no color")


switch myFavouriteColor {
case .White:
    print("White")
case .Black:
    print("Black")
case .Unknown:
    print("Unknown")
}



enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
    case undefined
}

var myBarcode : Barcode = .upc(10, 15, 23, 43)
myBarcode = .qrCode("AAAA")

switch myBarcode {
case .upc(let value1, let value2, let value3, let value4):
    print("upc: \(value1) \(value2) \(value3) \(value4) ")

case .qrCode(let value) where value == "AAAA":
    print("qrCode")

case .qrCode(let value):
    print("qrcode")
    
case .undefined:
    print("undefined")
}




struct Resolution {
    var width = 0
    var height = 0
}


class VideoMode {
    var resolution = Resolution()
    let framerate = 0.0
    var name : String?
}


let someResolution = Resolution(width: 1920, height: 1080)
let someViewMode = VideoMode()
someViewMode.resolution = someResolution

someViewMode.resolution.height




struct Rectangle {
    var origin:(x: Int, y: Int)
    var size:(width: Int, height: Int)
    
    var center:(x: Int, y: Int) = (0, 0){
//        get {
//            let centerX = origin.x + (size.width / 2)
//            let centerY = origin.y + (size.height / 2)
//            
//            return (x: centerX, y: centerY)
//        }
//        set (newCenter){
//            origin.x = newCenter.x - (size.width / 2)
//            origin.y = newCenter.y - (size.height / 2)
//        }
        
        willSet(newCenter){
           print("The value will be set from \(center) to \(newCenter)")
        }
        didSet{
            print("The value was be set from \(oldValue) to \(center)")

        }
    }
    
}


var negyzet = Rectangle(origin: (x: 10, y: 10), size: (width: 100, height: 100), center:(50, 30))
negyzet.center = (10, 20)



class SomeClass {
    var someData : Int
    let someConstant : Int

    static var storedTypeProperty = "Some value"
    
    class var storedType : Int {
        return 0
    }
    
    
    func increment(value : Int) {
        someData += value
    }
    
    init() {
        someData = 0
        someConstant = 100
    }
    
    init(withValue:Int) {
        someData = withValue
        someConstant = withValue
    }
    
    deinit {
        // do something
        print("dealloc")
    }
}

print(SomeClass.storedTypeProperty)

var data1 : SomeClass? = SomeClass()
data1?.someData
data1?.increment(value: 65)

data1 = nil



struct City {
    var name : String = ""

}

class User {
    var birthCity : City = City()
}

var someCity = City()
someCity.name = "Targu Mures"

var user = User()
user.birthCity = someCity   // City is a struct, the value is copied (not the reference)

someCity.name = "Udvarhely"   //
var vasile = User()
vasile.birthCity = someCity

print(user.birthCity.name)
print(vasile.birthCity.name)


let a = [1, 2, 3]
let b = Array(1...3)

if a == b { print("equal") }



//------

struct SomeAltStruct {
    var name = ""
    
}

class SomeAltClass {
    var name = ""
}

var struct1 = SomeAltStruct()
struct1.name = "name"
struct1 = SomeAltStruct()

let class1 = SomeAltClass()
class1.name = "other"
// class1 = SomeAltClass()  // it's a constant



//------

class someRandomClass {
    var name : String {
        get {
            return "ddd"
        }
        set {
            
        }
    }
    
    func doSomething() {
        print("do something")
    }
}

class otherClass : someRandomClass {
    
    override var name : String {
        get {
            return "asdasdasd"
        }
        set {
            
        }
    }
    
    override func doSomething() {
        super.doSomething()
        print("do something other")
    }
}

let randomData = otherClass()
randomData.doSomething()
print(randomData.name)


// generic parameters T and W - type of the object T (and W) is specified based on the parameter used in the function call
func swapInt<T, W>(_ a:T,_ b:W) -> (W, T) {
    return (b, a)
}

let (c, d) = swapInt(3, 5)
print("\(c) and \(d)")


class BaseUser { }
class ConcreteUser1 : BaseUser { }
class ConcreteUser2 : BaseUser { }

class Stack<Element> {
    var items = [Element]()
    
    func push(_ item:Element) {
        items.append(item)
    }
    
    func pop() -> Element {
        return items.removeLast()
    }
}

var someStack = Stack<String>()
someStack.push("one")
//someStack.push(2)  //not working becuase type is set to String
someStack.pop()







