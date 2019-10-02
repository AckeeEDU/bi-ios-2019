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
}
//: ### Mutating
example(of: "Mutating structure") {
    struct Person1 {
        let firstName: String
        let lastName: String
    }

    // Instantiate
    // Try to mutate
    
    struct Person2 {
        var firstName: String
        var lastName: String
        
        mutating func update(firstName: String) {
            self.firstName = firstName
        }
    }
    
    // Instatntiate
    // Mutate with mutating function
}
//: ### Value type
example(of: "Value type") {
    struct Person {
        var firstName: String
        var lastName: String
    }

    // Instantiate
    // Copy instance
    // Modify name
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
    // Try to mutate
    
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
    // Mutate
    // Mutate with mutating function
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
    // Copy instance
    // Modify name
}
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
    
    // STRUCTURES CAN'T INHERIT
    // Instantiate
}
//: ## Enumerations
//: ### Declaration
example(of: "Enum declaration") {
    // Enum with iOS languages
    // Assign to variable
    // Switch
}
//: [Next](@next)
