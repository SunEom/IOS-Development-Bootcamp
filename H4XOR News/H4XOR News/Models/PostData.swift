//
//  PostData.swift
//  H4XOR News
//
//  Created by 엄태양 on 2022/07/04.
//

import Foundation

struct Results : Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    var id: String {
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
}
