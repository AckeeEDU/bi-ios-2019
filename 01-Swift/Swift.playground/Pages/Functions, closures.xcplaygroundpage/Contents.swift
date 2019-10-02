//: [Previous](@previous)
//: # Functions, closures
import Foundation

//: ## Functions
//: ### Void
example(of: "Void functions") {
    func helloWorld() {
        print("Hello world")
    }
    // Definition with Void
    // Definition with empty tuple and return
    // Use functions
}
//: ### Return value
example(of: "Function with return value") {
    // Hello world that returns a value
}
//: ### Parameters
example(of: "Function with parameters") {
    // Add function with named parameters
    // Add function without parameter names
    // Add function with fancy parameter names
}
//: ### Default value
example(of: "Function parameter with default value") {
    // Add to function with default value
}
//: ## Closures
//: ### Function type
example(of: "Function type") {
    // Add function
    // Assign reference to variable
    // Type of
}
//: ### Closure declaration
example(of: "Closure declaration") {
    // Add closure
}
//: ### Closure as a function parameter
example(of: "Closure as a function parameter") {
    // Combine with a closure
    // Additon closure
    // Subtraction closure
}
//: ## References in closures
//: ### Reference captured by a closure
example(of: "Reference captured by a closure") {
    class Assignment {
        let title: String
        private(set) var completed: Bool
        var toggleCompletedClosure: (() -> Void)?
        
        init(title: String = "Title", completed: Bool = false) {
            self.title = title
            self.completed = completed
            
            toggleCompletedClosure = {
                self.completed.toggle()
            }
            
            print("Assignment \(title) initialized")
        }
        
        deinit {
            print("Assignment \(title) deinitialized")
        }
    }

    // Instantiate
    // Set to nil
}
//: ### Weak reference in a closure
example(of: "Weak reference in a closure") {
    class Assignment {
        let title: String
        private(set) var completed: Bool
        var toggleCompletedClosure: (() -> Void)?
        
        init(title: String = "Title", completed: Bool = false) {
            self.title = title
            self.completed = completed
            
            toggleCompletedClosure = { [weak self] in
                self?.completed.toggle()
            }
            print("Assignment \(title) initialized")
        }
        
        deinit {
            print("Assignment \(title) deinitialized")
        }
    }

    // Instantiate
    // Set to nil
}
//: ### Unowned reference
example(of: "Unowned reference") {
    class Assignment {
        let title: String
        private(set) var completed: Bool
        var toggleCompletedClosure: (() -> Void)?
        
        init(title: String = "Title", completed: Bool = false) {
            self.title = title
            self.completed = completed
            
            toggleCompletedClosure = { [unowned self] in
                self.completed.toggle()
            }
            print("Assignment \(title) initialized")
        }
        
        deinit {
            print("Assignment \(title) deinitialized")
        }
    }

    // Instantiate
    // Assign closure to variable
    // Set to nil
    // Call closure
}

//: [Next](@next)
