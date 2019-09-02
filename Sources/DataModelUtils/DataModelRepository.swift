//
//  DataModelRepository.swift
//  
//
//  Created by Michael Housh on 7/29/19.
//

/**
 # DataModelRepository
 --------
   
 A representation of a repository used to store and retrieve a `DataModel`.
 
 */
public protocol DataModelRepository {
    
    /// The `DataModel` associated with this repository.
    associatedtype Model: DataModel
    
    /// The return type, usually the associated `DataModel`, but does not have to be.
    associatedtype ModelReturnType: Codable
    
    /// Save or update a `Model`.
    /// - parameter model: The `Model` to save or update.
    func save(_ model: Model) -> ModelReturnType
    
    /// Fetch all the `Model`'s.
    func all() -> [ModelReturnType]
    
    /// Get a single `Model`, by id if it exists.
    /// - parameter id: The `Model.ID` to fetch.
    func get(id: Model.ID) -> Model?
    
    /// Delete a `Model` by id if it exists.
    /// - parameter id: The `Model.ID` to delete.
    func delete(id: Model.ID)
    
}
