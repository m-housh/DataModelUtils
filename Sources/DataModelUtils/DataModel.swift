//
//  DataModel.swift
//  
//
//  Created by Michael Housh on 7/29/19.
//

import Validation
import SwiftUI

/**
 # DataModel
 ------------
 
 A representation of a data object that can be used easily in `SwiftUI`.
 Conformance will ensure that your data model will inherit all the correct protocols.
 
 */
public protocol DataModel: BindableObject, Codable, Reflectable, ReflectionDecodable, Validatable { }

// MARK: - Validatable
extension DataModel {
    
    public static func validations() throws -> Validations<Self> {
        return Validations(Self.self)
    }
}
