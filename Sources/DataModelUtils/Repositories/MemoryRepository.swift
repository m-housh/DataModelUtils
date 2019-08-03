//
//  File.swift
//  
//
//  Created by Michael Housh on 7/29/19.
//

import SwiftUI
import Combine

/**
 # MemoryRepository
 ----------
 
 A `DataModelRepository` that stores values in memory.
 
 */
public final class MemoryRepository<T>: DataModelRepository where T: DataModel {

    public typealias Model = T
    public typealias ModelReturnType = T
    
    /// - seealso: `ObservableObject`
    public var objectWillChange = PassthroughSubject<Void, Never>()
    
    /// The data storage.
    private var data: [T] { willSet { update() } }
    
    /// - parameter type: The `DataModel.Type` associated with this repository
    /// - parameter models: Default models to be stored.
    public init(_ type: Model.Type, models: [Model] = []) {
        self.data = models
    }
    
    public func save(_ model: Model) -> Model {
        data.replaceOrAppend(model)
        return model
    }
    
    public func all() -> [Model] {
        return data
    }
    
    public func get(id: Model.ID) -> Model? {
        return data.filter { $0.id == id }.first
    }
    
    public func delete(id: Model.ID) {
        guard let index = data.firstIndex(where: { $0.id == id }) else {
            return
        }
        data.remove(at: index)
    }
    
}

extension MemoryRepository: ObservableObject { }
