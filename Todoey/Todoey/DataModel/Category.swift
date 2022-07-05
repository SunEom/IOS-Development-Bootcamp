//
//  Category.swift
//  Todoey
//
//  Created by 엄태양 on 2022/07/05.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    let items = List<Item>()
}
