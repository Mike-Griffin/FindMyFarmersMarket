//
//  FarmersMarketDataManager.swift
//  FindMyFarmersMarket
//
//  Created by Mike Griffin on 7/18/21.
//

import Foundation

final class FMFMDataManager {
    static let shared = FMFMDataManager()
    private init() {}
    func fetchFarmersMarkets() -> [FarmersMarket] {
        do {
            if let bundlePath = Bundle.main.path(forResource: FileName.farmersMarket,
                                                 ofType: "json") {
                if let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                    do {
                        let decodedData = try JSONDecoder().decode([FarmersMarket].self, from: jsonData)
                        print(decodedData)
                    } catch {
                        print("decode error")
                    }
                } else {
                    print("error: unable to read file data as json")
                }
            } else {
                print("error: unable to get file bundle path")
            }
        } catch {
            print(error.localizedDescription)
        }
        return []
    }
}
