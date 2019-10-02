//: [Previous](@previous)
//: # Extensions, protocols, delegates
import Foundation

//: ## Extensions
struct Person {
    let name: String
}

extension Person {
    // Property age
    // No stored properties in extensions
    // var age: Int

    // Computed property name components
    var nameComponents: [String] {
        return name.components(separatedBy: " ")
    }

    // Function name with degree
    func addDegree(_ degree: String) -> String {
        return "\(degree) \(name)"
    }
}

example(of: "Person extension") {
    // Instantiate
    let person = Person(name: "Jan Schwarz")

    // Use
    print(person.addDegree("Bc."))
    print(person.nameComponents)
}

//: ## Protocols
protocol Human {
    // Hair color variable
    var hairColor: String { get set }

    // Eye color constant
    var eyeColor: String { get }
}

protocol StoryTeller {
    // Tell story function
    func tellStory() -> String
}
//: ### Conform to protocol
struct Woman: Human {
    let eyeColor: String
    var hairColor: String
}
// Conform to StoryTeller
extension Woman: StoryTeller {
    func tellStory() -> String {
        return "Once upon a time..."
    }
}

struct Man: Human {
    let eyeColor: String
    var hairColor: String
    
    func tellStory() -> String {
        return "Once upon a time..."
    }
}

example(of: "Conform to protocol") {
    // Instantiate man
    let man = Man(eyeColor: "Black", hairColor: "Black")
    // Instantiate woman
    let woman = Woman(eyeColor: "Brown", hairColor: "Brown")

    // Human property
    var human: Human?

    // Assign women to human
    human = woman
    print(type(of: human))
    print(human?.eyeColor ?? "Nothing there")
    print(human?.hairColor ?? "Nothing there")
    human?.hairColor = "Blond"
    print(human?.hairColor ?? "Nothing there")
    human = nil
    print(human?.hairColor ?? "Nothing there")

    // Assign man to human
    human = man
    print(human?.eyeColor ?? "Nothing there")
    print(human?.hairColor ?? "Nothing there")

    // StoryTeller property
    var teller: StoryTeller?

    // Assign women to StoryTeller
    teller = woman
    print(teller?.tellStory() ?? "No story")

    // Assign man to StoryTeller
    // teller = man
}
//: ### Protocol extension
extension StoryTeller {
    func littleRedRidingHoodStory() -> String {
        return "Once upon a time there was a little red riding hood..."
    }
}

example(of: "Protocol extension") {
    // Instantiate
    let woman = Woman(eyeColor: "brown", hairColor: "brown")

    // Tell story
    print(woman.littleRedRidingHoodStory())
}
//: ## Delegates
class ViewWithButton {
    // Delegate
    weak var delegate: ViewWithButtonDelegate?
    
    // Tap on button method
    func buttonWasTapped() {
        delegate?.buttonWasTapped(in: self)
    }
}

class Controller {
    var view: ViewWithButton?
}

protocol ViewWithButtonDelegate: class {
    // Did tap on button
    func buttonWasTapped(in view: ViewWithButton)
}

// Conform Controller to protocol
extension Controller: ViewWithButtonDelegate {
    func buttonWasTapped(in view: ViewWithButton) {
        print("Button was tapped in \(view)")
    }
}

example(of: "Delegate") {
    // Create controller
    let controller = Controller()

    // Create view
    let view = ViewWithButton()

    // Point to each other
    controller.view = view
    view.delegate = controller

    // Tap on button
    view.buttonWasTapped()
}
//: [Next](@next)
