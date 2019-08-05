//
//  File.swift
//  
//
//  Created by Michael Housh on 7/29/19.
//

import DataModelUtils
import Combine

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


