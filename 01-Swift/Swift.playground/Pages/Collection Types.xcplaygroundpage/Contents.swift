//: [Previous](@previous)
//: # Collection types
import Foundation
//: ## Tuples
//: ### Declaration
example(of: "Tuple") {
    // Tuple first name and last name
    let tuple: (firstName: String, lastName: String) = ("Jan", "Schwarz")
    print(tuple.firstName)
}
//: ## Arrays
//: ### Declaration
example(of: "Array declaration") {
    let _ =  Array<String>()
    let _ = [String]()
    let _: [String] = []
    
    var attendees = ["Martin", "Tomas"]
    
    // Access first element
    print(attendees[0])

    // Set first element
    attendees[0] = "Jan"
    print(attendees[0])
}
//: ### Properties and methods
example(of: "Array properties and methods") {
    // Array of attendees
    var attendees = ["Martin", "Tomas"]
    
    // Count
    print(attendees.count)

    // isEmpty
    print(attendees.isEmpty)

    // first element
    if let firstElement = attendees.first {
        print(firstElement)
    }

    // Append element
    attendees.append("Jan")

    // Append collection
    attendees.append(contentsOf: ["Barborka"])

    // Insert
    attendees.insert("Vasek", at: 0)
    
    // Remove
    attendees.remove(at: 0)
    print(attendees)
    
    // Index out of range
    // print(attendees[10])
}
//: ### Loop array
example(of: "Loop array") {
    // Array of attendees
    let attendees = ["Martin", "Tomas"]

    // Loop attendees
    for attendee in attendees {
        print(attendee)
    }
    
    // Loop index to count-1
    for i in 0...attendees.count-1 {
        print(attendees[i])
    }
    
    // Enumerate
    for tuple in attendees.enumerated() {
        print("Index: \(tuple.offset), Element: \(tuple.element)")
    }
}
//: ## Dictionaries
//: ### Declaration
example(of: "Dictionary declaration") {
    let _ = Dictionary<String, String>()
    let _ = [String: String]()
    let _ : [String: String] = [:]
    
    var namesOfAttendess = [
        "Schwarz": "Jan",
        "Kaltoun": "Jan"
    ]
    
    // Access
    print(namesOfAttendess["Kaltoun"].debugDescription)
    print(namesOfAttendess["jfklsdjf"].debugDescription)

    // Change
    namesOfAttendess["Kaltoun"] = "Honza"
    print(namesOfAttendess["Kaltoun"].debugDescription)
}
//: ### Loop
example(of: "Loop dictionary") {
    // Dictionary with names of attendees
    let namesOfAttendess = [
        "Schwarz": "Jan",
        "Kaltoun": "Jan"
    ]
    
    // Loop
    for tuple in namesOfAttendess {
        print("\(tuple.key) \(tuple.value)")
    }
    
    for (surname, firstname) in namesOfAttendess {
        print("\(surname) \(firstname)")
    }
}
//: [Next](@next)
