//
//  File.swift
//  
//
//  Created by Michael Housh on 7/29/19.
//

import DataModelUtils
import Combine
import Foundation

final class BasicTestModel: DataModel {
    
    var willChange = PassthroughSubject<Void,Never>()
        
    var id: Int?
    var name: String
    
    init(id: Int? = nil, name: String = "") {
        self.id = id
        self.name = name
    }
}

extension BasicTestModel: ReflectionDecodable {
    static func reflectDecoded() throws -> (BasicTestModel, BasicTestModel) {
        return (.init(), .init(id: 1))
    }
    
    static func reflectDecodedIsLeft(_ item: BasicTestModel) throws -> Bool {
        return item.id == nil
    }
}

extension BasicTestModel: Codable {
    enum CodingKeys: String, CodingKey {
        case id, name
    }
}


final class TestDataModel: DataModel {
    
    
    var objectWillChange = PassthroughSubject<Void,Never>()
    
    var id: Int?
    var name: String
    
    init(id: Int? = nil, name: String = "") {
        self.id = id
        self.name = name
    }
}

extension TestDataModel: ReflectionDecodable {
    static func reflectDecoded() throws -> (TestDataModel, TestDataModel) {
        return (.init(), .init(id: 1))
    }
    
    static func reflectDecodedIsLeft(_ item: TestDataModel) throws -> Bool {
        return item.id == nil
    }
}

extension TestDataModel: Validatable {
    
    public static func validations() throws -> Validations<TestDataModel> {
        var validations = Validations(TestDataModel.self)
        try validations.add(\.name, !.empty)
        return validations
    }
}

extension TestDataModel: Codable {
    enum CodingKeys: String, CodingKey {
        case id, name
    }
}



class Resource {
    
    static var resourcePath = ProcessInfo.processInfo.environment["TEST_RESOURCES_DIR"] ?? "./Resources"
    
    let name: String
    let type: String?
    
    init(name: String, type: String? = nil) {
        self.name = name
        self.type = type
    }
    
    var path: String {
        guard let type = self.type else {
            return "\(name)"
        }
        return "\(name).\(type)"
    }
    
    var url: URL {
        let fullPath = "\(Resource.resourcePath)/\(path)"
        return URL(fileURLWithPath: fullPath)
    }
    
    var data: Data? {
        return try? Data(contentsOf: url)
    }
}



