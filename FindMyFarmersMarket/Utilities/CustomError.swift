//
//  CustomError.swift
//  FindMyFarmersMarket
//
//  Created by Mike Griffin on 7/21/21.
//

import Foundation

enum CustomError: Error {
    case bundleFile
    case jsonParse
}

extension CustomError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .bundleFile:
            return NSLocalizedString("The provided bundle file is not found",
                                     comment: "No file")
        case .jsonParse:
            return NSLocalizedString("The JSON could not be parsed",
                                     comment: "JSON parse error")
        }
    }
}
