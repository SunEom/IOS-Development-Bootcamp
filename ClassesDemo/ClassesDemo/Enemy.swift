
struct Enemy {
    var health: Int
    var attackStrength: Int
    
    init(health: Int, attackStrngth: Int) {
        self.health = health
        self.attackStrength = attackStrngth
    }
    
    mutating func takeDamage(amount: Int) {
        health = health - amount
    }
    
    func move() {
        print("Walk forwards.")
    }
    
    func attack() {
        print("Land a hit, does \(attackStrength) damage.")
    }
}
