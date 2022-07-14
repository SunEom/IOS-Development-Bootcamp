//
//  StructExample.swift
//  Struct vs. Class
//
//  Created by 엄태양 on 2022/07/14.
//

import Foundation

struct Structhero {
    
    var name: String
    var universe: String
    
//    func reverseName() -> String {
//        return String(name.reversed())
//    }
    
    mutating func reverseName() {
        self.name = String(self.name.reversed())
    }
}

