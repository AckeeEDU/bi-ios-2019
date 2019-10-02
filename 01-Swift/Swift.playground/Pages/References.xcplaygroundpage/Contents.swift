//: [Previous](@previous)
//: # References
import Foundation
//: ### Reference counting
example(of: "Reference counting") {
    class Person {
        let name: String
        
        init(name: String) {
            self.name = name
            
            print("Person \(name) initialized")
        }
        
        deinit {
            print("Person \(name) deinitialized")
        }
    }
    
    // First instance
    var person1: Person? = Person(name: "Jan")

    // Assign to second variable
    var person2: Person? = person1

    // Set to nil
    print("Setting person1 to nil")
    person1 = nil

    // Set to nil
    print("Setting person2 to nil")
    person2 = nil
}
//: ### Retain cycle
example(of: "Retain cycle") {
    class Person {
        let name: String
        var image: ProfileImage?
        
        init(name: String) {
            self.name = name
            
            print("Person \(name) initialized")
        }
        
        deinit {
            print("Person \(name) deinitialized")
        }
    }

    class ProfileImage {
        let url: URL?
        var person: Person?
        
        init(url: URL?) {
            self.url = url
            
            print("Image \(self) initialized")
        }
        
        deinit {
            print("Image \(self) deinitialized")
        }
    }
    
    // Create instances
    var person: Person? = Person(name: "Jan")
    var image: ProfileImage? = ProfileImage(url: nil)

    // Point to each other
    person?.image = image
    image?.person = person

    // Set to nil
    person = nil
    image = nil
}
//: ### Weak reference
example(of: "Weak reference") {
    class Person {
        let name: String
        var image: ProfileImage?
        
        init(name: String) {
            self.name = name
            print("Person \(name) initialized")
        }
        
        deinit {
            print("Person \(name) deinitialized")
        }
    }
    
    class ProfileImage {
        let url: URL?
        weak var person: Person?
        
        init(url: URL?) {
            self.url = url
            print("Image \(self) initialized")
        }
        
        deinit {
            print("Image \(self) deinitialized")
        }
    }
    
    // Create instances
    var person: Person? = Person(name: "Jan")
    var image: ProfileImage? = ProfileImage(url: nil)

    // Point to each other
    person?.image = image
    image?.person = person

    // Set to nil
    person = nil
    image = nil
}
//: [Next](@next)
