//: Playground - noun: a place where people can play

var message : String
message = "hello world"

let classMax :Int = 25

var name = "Phil"  //swift just used type infrence to know that name is a string, did not require defn.

print("this prints to the console")

print("\(name)")  // how to print a variable

let a = 42
let b = 0.2999
let c = Double(a) + b

print("a + b = " + "\(c)")

//touple: group together values of any type, different from an array

//operators

    //++ not allowed instead use +=

    //or = || , and = &&, not = !

    //range operators

        //(a..b) : closed, includes a and b and everything in between
        //(a..<b) : half open, everything from a up to but not including b

//if else
var age = 20
var young = "you whippersnapper"
var old = " you old fart"

if age < 21 {
    print(young)
}
else{
    print(old)
}

//Ternary operator

age < 21 ? young : old // condition ? true : false


//switch stements

let someCharacter: Character = "z"
switch someCharacter {
case "a":
    print("The first letter of the alphabet")
case "z":
    print("The last letter of the alphabet")
default:
    print("Some other character")
}


//loops

age = 2
for i in 0...age{
    print("\(i)")
}


while age < 8 {
    print ("young")
    age += 1
}

//repeat while

let finalSquare = 25
var board = [Int](repeating: 0, count: finalSquare + 1)
board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
var square = 0
var diceRoll = 0

repeat {
    // move up or down for a snake or ladder
    square += board[square]
    // roll the dice
    diceRoll += 1
    if diceRoll == 7 { diceRoll = 1 }
    // move by the rolled amount
    square += diceRoll
} while square < finalSquare
print("Game over!")

func sayHi(){
    print("hi")
}

sayHi()

func sayHello(first: String, last: String){
    print("Hello \(first) \(last)")
}

sayHello(first: "Bill", last: "Adams")

func sayWhere(_ place: String, _ time: String){
    print("\(place) \(time)")
}

sayWhere("here", "now")

// return value
