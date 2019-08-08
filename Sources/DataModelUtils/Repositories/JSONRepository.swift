//
//  File.swift
//  
//
//  Created by Michael Housh on 8/7/19.
//

import Foundation


public class JSONRepository<T>: MemoryRepository<T> where T: DataModel {
    
    public convenience init(_ type: Model.Type, url: URL) throws {
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        let models: [Model]
        
        do {
            models = try decoder.decode([Model].self, from: data)
        } catch {
            let model = try decoder.decode(Model.self, from: data)
            models = [model]
        }
        
        self.init(type, models: models)
    }
}
