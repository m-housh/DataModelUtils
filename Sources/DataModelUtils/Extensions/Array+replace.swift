//
//  Array+replace.swift
//  
//
//  Created by Michael Housh on 7/29/19.
//
import SwiftUI

public struct NotFoundError: Error {
    public let message: String = "Element not found"
}

extension Array where Element: Identifiable {
    
    /// Replace an element based on it's `ID`.
    mutating public func replace(_ element: Element) throws {
        guard let index = firstIndex(where: { $0.id == element.id }) else {
            throw NotFoundError()
        }
        remove(at: index)
        insert(element, at: index)
    }
    
    /// Replace or append an element.
    mutating public func replaceOrAppend(_ element: Element) {
        do {
            try replace(element)
        } catch {
            append(element)
        }
    }
}
