//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by 엄태양 on 2022/05/11.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let title: String
    let answer: String
    
    init(q: String, a: String){
        title = q
        answer = a
    }
}
