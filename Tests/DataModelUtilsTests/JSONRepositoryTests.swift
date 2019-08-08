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
        let url = URL(fileURLWithPath: "/tmp/datamodelutils/Resources/testModels.json")
        let repo = try! JSONRepository(BasicTestModel.self, url: url)
        XCTAssertEqual(repo.all().count, 5)
    }
    
    
    func testLoadingSingleModelFile() {
        let url = URL(fileURLWithPath: "/tmp/datamodelutils/Resources/testSingleModel.json")
        let repo = try! JSONRepository(BasicTestModel.self, url: url)
        XCTAssertEqual(repo.all().count, 1)
    }
    
}
