
/*
Question 0
- Change the value of the optionalName variable to nil.
- What greetings do you get?
 Answer: "Hello!"
- Add an else clause that sets a different greeting if optionalName is nil.
 */

var optionalString: String? = "Hello"
print(optionalString == nil)

var optionalName: String? = nil
var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)"
} else {
    greeting = "Hello, mystery person"
}


/*
Question 1
- Remove the day parameter from the greet function
- Add a parameter to include today's lunch special in the greeting.
 */

func greet(person: String, lunchSpecial: String) -> String {
    return "Hello \(person), today's lunch speical is \(lunchSpecial)."
}
greet(person: "Bob", lunchSpecial: "Chicken Fried Chicken for $9.99")


/*
Question 2
- Rewrite the closure to return zero for all even numbers.
 */

var numbers = [20, 19, 7, 12]
numbers.map({ (number: Int) -> Int in
    if (number % 2 == 0) {
        return 0
    }
    return 3 * number
})


/*
Question 3
Using the code below. Make another subclass of NamedShape called Circle that takes a radius and a name as arguments to its initializer. Implement an circumference() and a simpleDescription() method on the Circle class.
 */

class NamedShape {
    var numberOfSides: Int = 0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

class Circle: NamedShape {
    var radius: Double
    
    init(radius: Double, name: String) {
        self.radius = radius
        super.init(name: name)
    }
    
    func circumference() -> Double {
        return 2 * Double.pi * radius
    }
    
    override func simpleDescription() -> String {
        return "A circle with a radius of \(radius)."
    }
}
