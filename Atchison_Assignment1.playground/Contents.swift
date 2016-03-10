//: Playground - noun: a place where people can play

import UIKit

var str = "Hello Assignment 1"


//Optional Types

//different ways to declare optional types
var op1 = Optional("This is an optional type")
var op2 : Optional<String>
op2 = "This is also an optional type"

//using optional types as member variables
class Cat
{
    var name : Optional<String>
    var color : String?
}


func callCat(myCat : Cat)
{
    if(myCat.name == nil)
    {
        print("I dont have any cat to call!")
    }
    else
    {//unwrapping optional types
            print(myCat.name!.uppercaseString)
    }
    
}

func whatColor(myCat : Cat, isColor c: String)
{
    //conditional unwrapping and comparing optional and non optional types
    if(myCat.color?.lowercaseString == c.lowercaseString)
    {
        print("Correct! This cat is the color \(myCat.color!.lowercaseString)")
    }
    
}

let kitten = Cat()

callCat(kitten)

kitten.name = "Sammy"

print(kitten.name)

callCat(kitten)

whatColor(kitten, isColor: "brown")

kitten.color = "white"

whatColor(kitten, isColor: "WHITE")



//Object Types

//class methods
class DaysOfTheWeek
{
    class func Monday()
    {
        print("Ugh it is a Monday")
    }
    class func Friday()
    {
        print("WOOOO IT IS FRIDAY")
    }
}

DaysOfTheWeek.Monday()
DaysOfTheWeek.Friday()

class Human{
    //enums
    enum Sex{
        case Female
        case Male
    }
    var sex : Sex
    var age : Int
    var name : String
    
    init?(sex: Sex, named name: String, isAge age: Int = 0)
    {
        self.sex = sex
        self.name = name
        self.age = age
        
        self.revealSex()
    }
    
    func revealSex()
    {
        if(sex == Sex.Male)
        {
            print("It's a boy!")
        }
        else
        {
            print("It's a girl!")
        }
    }
}

var baby1 = Human(sex: Human.Sex.Female, named:"Sally")

baby1?.revealSex()


//subscripts
class Farm {
    private var Animals = ["Cow","Horse","Pig","Turkey"]
    private var AnimalSounds = ["Moo","Neigh","Oink","Gobble"]
    
    subscript(idx: Int) -> String{
        return "\(Animals[idx]) goes \(AnimalSounds[idx].uppercaseString)"
    }
    
}

let myFarm = Farm()
print(myFarm[1])

//STRUCTS AND CLASSES

enum AirmanRank : Int{
    case SecondLieutenant = 0
    case FirstLieutenant = 1
    case Captain = 2
    case Major = 3
    case Colonel = 4
    
    mutating func rankUp()
    {
        let nextRank = AirmanRank(rawValue: self.rawValue+1)
        self = nextRank!
    }
}

var thisRank = AirmanRank.SecondLieutenant
thisRank.rankUp()

//NOTE classes are reference types
//NOTE structs are value types

//structs as containers of constants
struct CourseInfo{
    static let COURSE_NAME = "iOS Programming"
    static let COURSE_NUMBER = 370
}

print("This is \(CourseInfo.COURSE_NAME), course number \(CourseInfo.COURSE_NUMBER)")


class Dog
{
    var name : String
    var age : Int
    
    init(name: String, age : Int = 0)
    {
        self.name = name
        self.age = age
        
    }
    
    func bark()
    {
        print("WOOF WOOF")
    }
    
    func goGetThe(item : String)
    {
        print("Fetching \(item)!!!")
    }
    
    func getOlder()
    {
        self.age = self.age + 1
    }
}

class GoldenRetriver : Dog{
    func seeOwner()
    {
        print("**Flies into a happy fury**")
    }
}

class Yorkie : Dog{
    final override func bark()
    {
        print("yip yip")
    }
    override func goGetThe(item: String) {
        print("Run away from \(item)")
    }
}

class TrainedYorkie : Yorkie{
    
    //cant do this because Yorkie used final override on bark
    //override func bark()
    //{
    //    print("woof")
    //}
    override func goGetThe(item: String) {
        print("Dragging \(item)")
    }
}

//PROTOCALS AND EXTENSIONS


//protocols are outlines that must be fulfilled
protocol Organization
{
    var OrgName : String { get }
    var OrgMembers : Int {get set}
    
    func orgMoto()
    
}

//instances must fulfill all aspects of protocol (can add own aspects too)
class RoboticsClub : Organization
{
    var OrgName : String = "Robotics Club"
    var OrgMembers : Int = 0
    var RobotName : String?
    
    func orgMoto() {
        print("Learn Robotics")
    }
    
}

let ChapmanRoboClub = RoboticsClub()

ChapmanRoboClub.OrgMembers = 5
ChapmanRoboClub.RobotName = "Ted"
ChapmanRoboClub.orgMoto()

func introduceOrg(org : Organization)
{
    print("This is \(org.OrgName) with \(org.OrgMembers) members")
    print("They aim to...")
    org.orgMoto()
}

introduceOrg(ChapmanRoboClub)


//umbrella types and array initializations
var Zoo : [AnyClass] = []
var ZooAnimals : [AnyObject] = []
var CrazyZoo : [Any] = []

class Giraffe{
    var name : String?
    var numLegs : Int = 4
}

Zoo.append(Giraffe)
let g = Giraffe()
ZooAnimals.append(g)
CrazyZoo.append("Rhino")
CrazyZoo.append(Giraffe)

//extensions
extension String
{
    func removeAllInstancesOf(c : Character) -> String
    {
        var newString : String = ""
        for x in self.characters
        {
            if(x != c)
            {
                newString += String(x)
            }
        }
        return newString
    }
}

var s = "wassssuppppp"
s = s.removeAllInstancesOf("p")
s

//ERROR COLLECTION FLOW

//switch statements  class standing

enum ClassStanding{
    case Freshman
    case Sophomore
    case Junior
    case Senior
}

let s1 : ClassStanding = .Freshman
switch s1{
case .Freshman:
    print("4 years left lol")
case .Sophomore:
    print("3 years left, keep trucking")
case .Junior:
    print("2 years left WOOOOO")
    fallthrough
case .Senior:
    print("1 year left YOU GOT DIS")
}

//ternary operators
let num = 2
let isEven = (num%2 == 0) ? "Even" : "Odd"

//while binding
var nums : [Int] = [3,4,5,2,5]
while let x = nums.popLast()
{
    if(x%2==0)
    {
        print("\(x) is Even")
    }
    else
    {
        print("\(x) is Odd")
    }
}

for x in nums where num%2 == 0
{
    print("\(x) is Even")
}

//labeled break
var y = 10
infinite : while(true)
{
    while(y>5)
    {
        y = y-1
        print("hi")
        if(y == 7)
        {
            break infinite
        }

    }
    print("bye")
}

var deezNums : [Int] = [3,4,5,2,5]

//slicing
print(deezNums[0...2])

//enumerations
let containsOdd = deezNums.filter{(d:Int) -> Bool in
    return d%2 != 0
}
print(containsOdd)


//transformation
var sum :Int = 0
deezNums.forEach {(num) -> () in
    sum += num
}
print(sum)


//initializing a dictionary
var logins = [String:String]()
logins["asatchison"] = "hello"
logins["123"] = "hi"

//throwable types
enum Errors : ErrorType
{
    case ThisIndexIsntHere
}
func getFifthNumber(someNums : Array<Int>) throws -> Int
{
    if(someNums.indices.contains(4))
    {
        return someNums[4]
    }
    else
    {
        throw Errors.ThisIndexIsntHere
    }
    
}

let numbers : [Int] = [1,2,3]

do{
    try(getFifthNumber(numbers))
}
catch{
    print("Error")
}

//runtime error

let fifth = try? getFifthNumber(numbers)









