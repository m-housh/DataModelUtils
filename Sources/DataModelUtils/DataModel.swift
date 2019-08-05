//
//  DataModel.swift
//  
//
//  Created by Michael Housh on 7/29/19.
//

//import Validation
import SwiftUI

/**
 # DataModel
 ------------
 
 A representation of a data object that can be used easily in `SwiftUI`.
 Conformance will ensure that your data model will inherit all the correct protocols.
 
 */
public protocol DataModel: ObservableObject, Codable, Reflectable, ReflectionDecodable, Validatable, Identifiable { }

// MARK: - Validatable
extension DataModel {
    
    public static func validations() throws -> Validations<Self> {
        return Validations(Self.self)
    }
}


// MARK: Reflectable
extension DataModel {
    
    static func reflectProperties(depth: Int) throws -> [ReflectedProperty] {
        return try reflectProperties(depth: 0)
    }
    
    static func anyReflectProperty<T>(valueType: Any.Type, keyPath: KeyPath<Self, T>) throws -> ReflectedProperty? {
        return try anyReflectProperty(valueType: T.self, keyPath: keyPath)
    }
}
