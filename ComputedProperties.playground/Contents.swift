import UIKit

var pizzaInInches: Int = 10 {
    willSet {
        
    }
    didSet {
        if pizzaInInches >= 18 {
            print("Invalid size specified, pizzaInInches set to 18.")
            pizzaInInches = 18
        }
    }
}

pizzaInInches = 33

print(pizzaInInches)




var numberOfPeople: Int = 12
let slicePerPerson: Int = 4

var numberOfSlices: Int {
    get {
        return pizzaInInches - 4
    }
}

var numberOfPizza: Int {
    get {
        let numberOfPeoplerFedPerPizza = numberOfSlices / slicePerPerson
        return numberOfPeople / numberOfPeoplerFedPerPizza
    }
    set {
        let totalSlices = numberOfSlices * newValue
        numberOfPeople = totalSlices / slicePerPerson
    }
}

