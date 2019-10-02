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
    func helloWorld1() -> Void {
        print("Hello world 1")
    }
    
    // Definition with empty tuple and return
    func helloWorld2() -> () {
        print("Hello world 2")
        return
    }

    // Use functions
    helloWorld()
    helloWorld1()
    helloWorld2()
}
//: ### Return value
example(of: "Function with return value") {
    // Hello world that returns a value
    func getHelloWorld() -> String {
        return "Hello world"
    }
    
    print(getHelloWorld())
}
//: ### Parameters
example(of: "Function with parameters") {
    // Add function with named parameters
    func add(a: Int, b: Int) -> Int {
        return a + b
    }

    // Add function without parameter names
    func anonymousAdd(_ a: Int, _ b: Int) -> Int {
        return a + b
    }

    // Add function with fancy parameter names
    func fancyAdd(augend a: Int, addend b: Int) -> Int {
        return a + b
    }
    
    print(add(a: 1, b: 2))
    print(anonymousAdd(1, 2))
    print(fancyAdd(augend: 1, addend: 2))
}
//: ### Default value
example(of: "Function parameter with default value") {
    // Add to function with default value
    func add(number a: Int, to b: Int = 48) -> Int {
        return a + b
    }
    
    print(add(number: 2, to: 40))
    print(add(number: 2))
}
//: ## Closures
//: ### Function type
example(of: "Function type") {
    // Add function
    func add(a: Int, b: Int) -> Int {
        return a + b
    }

    // Assign reference to variable
    let addFunction = add

    // Type of
    print(type(of: addFunction))
}
//: ### Closure declaration
example(of: "Closure declaration") {
    // Add closure
    let add: (Int, Int) -> Int = { a, b in
        return a + b
    }
    
    print(add(1, 2))
}
//: ### Closure as a function parameter
example(of: "Closure as a function parameter") {
    // Combine with a closure
    func combine(a: Int, b: Int, with block: (Int, Int) -> Int) -> Int {
        return block(a, b)
    }
    
    // Additon closure
    let addition = combine(a: 1, b: 2, with: { a, b in
        return a + b
    })
    print(addition)

    // Subtraction closure
    let subtract: (Int, Int) -> Int = { a, b in
        return a - b
    }
    
    let subtraction = combine(a: 1, b: 2, with: subtract)
    print(subtraction)
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
    var assignment: Assignment? = Assignment()

    // Set to nil
    assignment = nil
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
    var assignment: Assignment? = Assignment()

    // Set to nil
    assignment = nil
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
    var assignment: Assignment? = Assignment()

    // Assign closure to variable
    let closure = assignment?.toggleCompletedClosure

    // Set to nil
    assignment = nil

    // Call closure
    // closure?()
}

//: [Next](@next)
