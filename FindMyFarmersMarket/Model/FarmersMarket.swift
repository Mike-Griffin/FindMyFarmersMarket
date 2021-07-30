//
//  FarmersMarket.swift
//  FindMyFarmersMarket
//
//  Created by Mike Griffin on 7/18/21.
//

import Foundation

struct FarmersMarket: Codable {
    let name: String
    let city: String
    let state: String
    let vendorIds: [Int]
}
