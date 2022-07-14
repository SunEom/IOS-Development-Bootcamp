//
//  main.swift
//  Struct vs. Class
//
//  Created by 엄태양 on 2022/07/14.
//

import Foundation

//MARK: - Class
//var hero = Classhero(name: "Iron Man", universe: "Marvel")
//var anotherMarvelHero = hero
//
//anotherMarvelHero.name = "The Hulk"
//
//var avengers = [hero, anotherMarvelHero]
//
//avengers[0].name = "Thor"
//
//print("hero name = \(hero.name)")
//print("anotherMarvelHero name = \(anotherMarvelHero.name)")
//print("first avenger name = \(avengers[0].name)")

//MARK: - Struct
//var hero = Structhero(name: "Iron Man", universe: "Marvel")
//var anotherMarvelHero = hero
//
//anotherMarvelHero.name = "The Hulk"
//
//var avengers = [hero, anotherMarvelHero]
//
//avengers[0].name = "Thor"
//
//print("hero name = \(hero.name)")
//print("anotherMarvelHero name = \(anotherMarvelHero.name)")
//print("first avenger name = \(avengers[0].name)")


//MARK: - Class
//let hero = Classhero(name: "Iron Man", universe: "Marvel")
//
//hero.name = "Cat Woman"
//hero.universe = "DC"


//MARK: - Struct
let hero = Structhero(name: "Iron Man", universe: "Marvel")

//hero.name = "Cat Woman" //Error!
//hero.universe = "DC" //Error!

print(hero.reverseName())

