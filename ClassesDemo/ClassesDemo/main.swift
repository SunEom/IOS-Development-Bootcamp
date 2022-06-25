
var skeleton1 = Enemy(health: 100, attackStrngth: 10)
var skeleton2 = skeleton1

skeleton1.takeDamage(amount: 10)

print(skeleton2.health)

skeleton1.takeDamage(amount: 10)
skeleton2.takeDamage(amount: 10)

print(skeleton1.health)
print(skeleton2.health)

//print(skeleton.health)
//skeleton.move()
//skeleton.attack()

//let dragon = Dragon()
//dragon.wingSpan = 5
//dragon.attackStrength = 15
//dragon.talk(speech: "My teech are swords! My claws are spears! My wings are a hurricane!")
//dragon.move()
//dragon.attack()



