//
//  File.swift
//  
//
//  Created by Michael Housh on 7/29/19.
//

import SwiftUI
import Combine


extension BindableObject where PublisherType: PassthroughSubject<Void, Never> {
    
    /// Notifies when changes are made to the object.
    /// - seealso: `BindableObject`
    public func update() { willChange.send() }
}
