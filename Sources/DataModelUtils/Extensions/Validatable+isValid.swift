//
//  Validatable+isValid.swift
//  
//
//  Created by Michael Housh on 7/29/19.
//

//import Validation


extension Validatable {
    
    /// Runs the validations on an object.
    public var isValid: Bool {
        do {
            try validate()
            return true
        } catch (let error) {
            print("ValidationError: \(error.localizedDescription)")
            return false
        }
    }
}
