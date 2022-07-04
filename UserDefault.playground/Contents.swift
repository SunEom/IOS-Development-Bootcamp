import Foundation

//MARK: - UserDefaults

//let defaults = UserDefaults.standard
//
//defaults.set(0.24, forKey:"Volume")
//defaults.set(true, forKey: "MusicOn")
//defaults.set("Angela", forKey: "PlayerName")
//defaults.set(Date(), forKey: "AppLastOpenedByUser")
//
//let array = [1,2,3]
//defaults.set(array, forKey: "myArray")
//
//let dictionary = ["name": "angela"]
//defaults.set(dictionary, forKey: "myDictionary")
//
//
//
//let volume = defaults.float(forKey: "Volume")
//let appLastOpen = defaults.object(forKey: "AppLastOpenedByUser")
//let myArray = defaults.array(forKey: "myArray") as! [Int]
//let myDictionary = defaults.object(forKey: "myDictionary") as! [String : String]
//
//

//MARK: - Singleton

class Car {
    var colour = "Red"
}

let myCar = Car()
myCar.colour = "Blue"

let yourCar = Car()
print(yourCar.colour)


class Car2 {
    var colour = "Red"
    static let singletonCar = Car()
}

let myCar2 = Car2.singletonCar
myCar2.colour = "Blue"

let yourCar2 = Car2.singletonCar
print(yourCar2.colour)
