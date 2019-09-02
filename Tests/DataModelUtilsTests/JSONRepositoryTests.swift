//
//  File.swift
//  
//
//  Created by Michael Housh on 8/7/19.
//

import XCTest
import DataModelUtils


class JSONRepositoryTests: XCTestCase {
    
    
    func testLoadingJSON() {
        let resource = Resource(name: "testModels.json")
        //let url = URL(fileURLWithPath: "/tmp/datamodelutils/Resources/testModels.json")
        let repo = try! JSONRepository(BasicTestModel.self, url: resource.url)
        XCTAssertEqual(repo.all().count, 5)
    }
    
    
    func testLoadingSingleModelFile() {
        let resource = Resource(name: "testSingleModel", type: "json")
        //let url = URL(fileURLWithPath: "/tmp/datamodelutils/Resources/testSingleModel.json")
        let repo = try! JSONRepository(BasicTestModel.self, url: resource.url)
        XCTAssertEqual(repo.all().count, 1)
    }
    
}
