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
    
}
