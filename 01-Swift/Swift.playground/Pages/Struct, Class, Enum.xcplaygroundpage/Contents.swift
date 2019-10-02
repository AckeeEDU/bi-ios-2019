//: [Previous](@previous)
//: # Structures, classes, enumerations
import Foundation
//: ## Structures
//: ### Declaration
example(of: "Struct declaration") {
    struct Person {
        let firstName: String
        let lastName: String
    }
    
    // Instantiate
    
    let person = Person(firstName: "Jan", lastName: "Schwarz")
    print(person)
}
//: ### Explicit initializer
example(of: "Struct with explicit initializer") {
    struct Person {
        let firstName: String
        let lastName: String
        
        init(firstName: String) {
            self.firstName = firstName
            self.lastName = "Schwarz"
        }
    }
    
    // Initialize
    let person = Person(firstName: "Jan")
    print(person)
}
//: ### Mutating
example(of: "Mutating structure") {
    struct Person1 {
        let firstName: String
        let lastName: String
    }

    // Instantiate
    let person1 = Person1(firstName: "Jan", lastName: "Schwarz")
    
    // Try to mutate
    //person1.firstName = "Honza"

    struct Person2 {
        var firstName: String
        var lastName: String
        
        mutating func update(firstName: String) {
            self.firstName = firstName
        }
    }
    
    // Instatntiate
    var person2 = Person2(firstName: "", lastName: "")
    person2.firstName = "Jan"
    print(person2)
    
    // Mutate with mutating function
    person2.update(firstName: "Honza")
    print(person2)
}
//: ### Value type
example(of: "Value type") {
    struct Person {
        var firstName: String
        var lastName: String
    }

    // Instantiate
    let person1 = Person(firstName: "Jan", lastName: "")
    
    // Copy instance
    var person2 = person1
    
    // Modify name
    person2.firstName = "Honza"
    
    print(person1.firstName)
    print(person2.firstName)
}
//: ## Classes
//: ### Declaration
example(of: "Class declaration") {
    class Person {
        let firstName: String
        let lastName: String
        
        init(firstName: String, lastName: String) {
            self.firstName = firstName
            self.lastName = lastName
        }
    }
    
    // Instantiate
    let person = Person(firstName: "", lastName: "")
    print(person)
}
//: ### Mutating
example(of: "Mutating class") {
    class Person1 {
        let firstName: String
        let lastName: String
        
        init(firstName: String, lastName: String) {
            self.firstName = firstName
            self.lastName = lastName
        }
    }
    
    // Instantiate
    let person1 = Person1(firstName: "", lastName: "")
    // Try to mutate
    // person1.firstName = "Jan"

    class Person2 {
        var firstName: String
        var lastName: String
        
        init(firstName: String, lastName: String) {
            self.firstName = firstName
            self.lastName = lastName
        }
        
        func update(firstName: String) {
            self.firstName = firstName
        }
    }
    
    // Instatntiate
    let person2 = Person2(firstName: "", lastName: "")

    // Mutate
    person2.firstName = "Jan"
    
    // Mutate with mutating function
    person2.update(firstName: "Honza")
    print(person2.firstName)
}
//: ### Reference type
example(of: "Reference type") {
    class Person {
        var firstName: String
        var lastName: String
        
        init(firstName: String, lastName: String) {
            self.firstName = firstName
            self.lastName = lastName
        }
    }
    
    // Instantiate
    let person1 = Person(firstName: "", lastName: "")
    
    // Copy instance
    let person2 = person1

    // Modify name
    person2.firstName = "Jan"
    
    print(person1.firstName)
    print(person2.firstName)}
//: ### Inheritance
example(of: "Inheritance") {
    class Person {
        var firstName: String
        var lastName: String
        
        init() {
            self.firstName = "Jan"
            self.lastName = "Schwarz"
        }
    }
    
    class UppercasedPerson: Person {
        override init() {
            super.init()
            
            self.firstName = "JAN"
            self.lastName = "SCHWARZ"
        }
    }
    
    // Instantiate
    let person = UppercasedPerson()
    print(person.firstName)

    // STRUCTURES CAN'T INHERIT
}
//: ## Enumerations
//: ### Declaration
example(of: "Enum declaration") {
    // Enum with iOS languages
    enum Langauge {
        case swift
        case objc
        case c
    }
    
    // Assign to variable
    let lang = Langauge.swift
    
    // Switch
    switch lang {
    case .swift:
        print("Good language")
    default:
        print("Bad")
    }
}
//: [Next](@next)
