// We already know about constants vs variables but there is another choice always present.
var x = 7
var f: Float = 7
let dave = "Dave"
//dave = "Bob"  // Would cause an error

// Part 1.
// Optionals
var optionalFloat: Float?
var requiredFloat: Float

optionalFloat = 5.0
requiredFloat = 5.0

print("optionalFloat = \(optionalFloat)")
print("requiredFloat = \(requiredFloat)")

// Optionals with forced unwrapping
print("optionalFloat = \(optionalFloat!)")

let name = "Dave"
let number = "7"
var optionalThatIsNil: Int? = Int(name)
var requiredThatIsNotNil: Int = Int(number)!

optionalThatIsNil
requiredThatIsNotNil


// Part 2.
// Views in a Playground + Optional Chaining





// Optional Binding








// Implicitly Unwrapped Optionals
