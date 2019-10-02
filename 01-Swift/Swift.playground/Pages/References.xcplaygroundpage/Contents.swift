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
    // Assign to second variable
    // Set to nil
    // Set to nil
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
    // Point to each other
    // Set to nil
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
    // Point to each other
    // Set to nil
    // Unowned
}
//: [Next](@next)
