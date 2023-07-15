//
//  BeerModel.swift
//  Big Bellies
//
//  Created by Nazar Dremach on 4/7/23.
//

import Foundation
import UIKit

struct Beer {
    let name: String
    let country: String
    let type: BeerType
    let prices: (Decimal, Decimal, Decimal)
    var volume: Decimal
    let image: UIImage
}

enum BeerType {
    case light, dark
}
