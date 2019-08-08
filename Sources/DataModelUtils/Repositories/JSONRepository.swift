//
//  JSONRepository.swift
//  
//
//  Created by Michael Housh on 8/7/19.
//

import Foundation

/**
 # JSONRepository
 -----------
 
 A `DataModelRepository` that loads it's data from a file into memory.
 
 ## Usage
 -----
 
 ```swift
 
 let url = URL(fileUrlWithPath: "/my/path/to/model.json")
 let repo = try JSONRepository(MyDataModel.self, url: url)
 
 print(repo.all().count)
 
 ```
 */
public class JSONRepository<T>: MemoryRepository<T> where T: DataModel {
    
    public convenience init(_ type: Model.Type, url: URL) throws {
        
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        let models: [Model]
        
        do {
            // try to load as an array.
            models = try decoder.decode([Model].self, from: data)
        } catch {
            // if failed to load as an array, then try to load as a single object.
            let model = try decoder.decode(Model.self, from: data)
            models = [model]
        }
        
        self.init(type, models: models)
    }
}
