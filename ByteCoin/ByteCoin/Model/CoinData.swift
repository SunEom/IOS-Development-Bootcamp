//
//  CoinData.swift
//  ByteCoin
//
//  Created by 엄태양 on 2022/06/28.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct CoinData: Decodable {
    let asset_id_base : String
    let asset_id_quote: String
    let rate: Double
}
