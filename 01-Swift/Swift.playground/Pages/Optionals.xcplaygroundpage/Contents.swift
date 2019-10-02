//: [Previous](@previous)
//: # Optionals
import Foundation
//: ## Introduction
//: ### Why optionals
example(of: "Type casting") {
    // Cast string age to number
    let stringAge = "a"
    let age = Int(stringAge)
    
    // Type of result
    print(type(of: age))
}
//: ### Declare an optional
example(of: "Optional integer") {
    // Optional age and type of it
    var age: Int?
    age = 28
    print(age.debugDescription)

    // Set to nil
    age = nil
    print(age.debugDescription)
    
    // Set non-optional to nil
    // var nonOptionalAge = 28
    // nonOptionalAge = nil
}
//: ## Unwrapping
//: ### Force unwrap
example(of: "Force unwrap") {
    // Optional age
    var age: Int? = 29
    print(age)
    
    // If age is nil, equal to 28, force unwrap
    if age == nil {
        print("There is a nil")
    } else if age == 28 {
        print("Age is 28")
    } else {
        print("Age is \(age!)")
    }
    
    // DANGER DANGER DANGER
    // Force unwrap nil
    //    age = nil
    //    print("Age is \(age!)")
}
//: ### If let
example(of: "If let") {
    // Optional age
    let age: Int? = 28

    // If let with types of wrapped and unwrapped
    if let unwrappedAge = age {
        print("My age is \(unwrappedAge)")
        print(type(of: age))
        print(type(of: unwrappedAge))
    }
}
//: ### Guard let
example(of: "Guard let") {
    // Optional age
    let age: Int? = 28
    
    // Guard let
    guard let unwrappedAge = age else {
        print("There was a nil")
        return
    }
    
    print("My age is \(unwrappedAge)")
    print(type(of: age))
    print(type(of: unwrappedAge))
}
//: ## Working with optionals
//: ### Calling function on optional
example(of: "Calling function on optional") {
    // Optional age
    var age: Int? = 28

    // If let and signum
    if let age = age {
        print(age.signum())
    }

    // Questionmark distance
    let advanced = age?.distance(to: 30)
    print(type(of: advanced))
    
    // Exclamation advanced by
    let distance = age!.advanced(by: 2)
    print(type(of: distance))
    
    // DANGER DANGER DANGER
    // Exclamation mark with nil
    age = nil
    // age!.distance(to: 30)
}
//: ### Implicitly unwrapped optional
example(of: "Implicitly unwrapped optional") {
    // DANGER DANGER DANGER
    // Implicitly unwrapped name
    var name: String! = "Jan"
    
    // Type of name
    print(type(of: name))
    
    // Count characters
    print(name.count)
    print(type(of: name.count))
    
    // Set to nil
    name = nil
    
    // Count characters
    // name.count
}
//: [Next](@next)
