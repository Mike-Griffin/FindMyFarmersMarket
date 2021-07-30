//
//  FarmersMarketDataManager.swift
//  FindMyFarmersMarket
//
//  Created by Mike Griffin on 7/18/21.
//

import Foundation

final class FMFMDataManager {
    static let shared = FMFMDataManager()
    let dataQueue = DispatchQueue(label: GCDLabel.data)
    var cachedVendors: [Int: Vendor] = [:]
    private init() {}
    func fetchFarmersMarkets(completed: @escaping (Result<[FarmersMarket], Error>) -> Void) {
        dataQueue.async {
        do {
            if let bundlePath = Bundle.main.path(forResource: FileName.farmersMarket,
                                                 ofType: "json") {
                if let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                    do {
                        let decodedData = try JSONDecoder().decode([FarmersMarket].self, from: jsonData)
                        completed(.success(decodedData))
                    } catch {
                        completed(.failure(error))
                    }
                } else {
                    completed(.failure(CustomError.jsonParse))
                }
            } else {
                completed(.failure(CustomError.bundleFile))
            }
        } catch {
            completed(.failure(error))
        }
        }
    }
    func fetchVendors(completed: @escaping (Result<[Vendor], Error>) -> Void) {
        dataQueue.async { [self] in
        do {
            if let bundlePath = Bundle.main.path(forResource: FileName.vendors,
                                                 ofType: "json") {
                if let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                    do {
                        let decodedData = try JSONDecoder().decode([Vendor].self, from: jsonData)
                        for vendor in decodedData {
                            cachedVendors[vendor.id] = vendor
                        }
                        completed(.success(decodedData))
                    } catch {
                        completed(.failure(error))
                    }
                } else {
                    completed(.failure(CustomError.jsonParse))
                }
            } else {
                completed(.failure(CustomError.bundleFile))
            }
        } catch {
            completed(.failure(error))
        }
        }
    }
    func fetchVendorsFromMarket(_ market: FarmersMarket) -> [Vendor] {
        market.vendorIds.compactMap{ cachedVendors[$0] }
    }
}
