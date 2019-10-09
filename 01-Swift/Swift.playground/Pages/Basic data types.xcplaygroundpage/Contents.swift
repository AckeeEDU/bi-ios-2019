//: # Basic data types
import Foundation

//: ### Strings
example(of: "Strings") {
    // Inferred string
    let helloWorld = "Hello world!"
    print(helloWorld)
    print(type(of: helloWorld))
    
    // Explicit string
    let helloWorld1: String = "Hello World!"
    print(helloWorld1)
}
//: ### Numbers
example(of: "Numbers") {
    // Integer
    let age: Int = 28
    print(age)
    
    // Inferred decimal and type of inferred decimal
    let height = 1.75
    print(type(of: height))
    
    // Float
    let floatHeight: Float = 1.75
    print(type(of: floatHeight))
}
//: ### Boolean
example(of: "Boolean") {
    let completed: Bool = false
    print(completed)
}
//: ### Mutability
example(of: "Mutability") {
    // Mutate let string
    let name = "Jan"
    // name = "Honza"
    
    // Mutate var string
    var lastName = "Schwarz"
    lastName = "Kaltoun"
    print(lastName)
}
//: [Next](@next)
