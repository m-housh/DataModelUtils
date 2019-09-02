//
//  File.swift
//  
//
//  Created by Michael Housh on 8/7/19.
//

import Foundation


public struct DataModelError: Error {
    let message: String
    
    public init(_ message: String) {
        self.message = message
    }
}
