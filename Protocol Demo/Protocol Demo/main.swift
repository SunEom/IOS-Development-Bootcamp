
protocol CanFly {
    func fly()
}

class Bird {
    
    var isFemale = true
    
    func layEgg() {
        if isFemale {
            print("the bird makes a new bird in a shell.")
        }
    }
}


class Eagle: Bird, CanFly {
    
    func soar() {
        print("the eagle glides in the air using air currents.")
    }
    
    func fly() {
        print("The Eagle flaps its wings and lifts off into the sky.")
    }
}

class Penguin:Bird {
    func swin() {
        print("The penguuin paddles through the water.")
    }
}

struct FlyingMuseum {
    func flyingDemo(flyingObject: CanFly) {
        flyingObject.fly()
    }
}

struct Airplane: CanFly  {

    func fly() {
        print("The air plane uses its engine to lift off into the air.")
    }
    
}

let myEagle = Eagle()
let myPenguin = Penguin()
let myPlane = Airplane()

let museum = FlyingMuseum()
museum.flyingDemo(flyingObject: myPlane)
