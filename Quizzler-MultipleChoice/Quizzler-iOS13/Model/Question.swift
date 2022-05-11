//
//  Quiz.swift
//  Quizzler-iOS13
//
//  Created by 엄태양 on 2022/05/11.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let title: String
    let answers: [String]
    let correctAnswer: String
    
    init(q title: String, a answers: [String], correctAnswer : String) {
        self.title = title
        self.answers = answers
        self.correctAnswer = correctAnswer
    }
}
