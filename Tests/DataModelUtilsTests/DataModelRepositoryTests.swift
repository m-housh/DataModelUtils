//
//  DataModelRepositoryTests.swift
//  
//
//  Created by Michael Housh on 7/29/19.
//

import XCTest
import DataModelUtils


final class DataModelRepositoryTests: XCTestCase {
    
    var repo: MemoryRepository<BasicTestModel>!
    
    override func setUp() {
        repo = MemoryRepository(BasicTestModel.self)
    }
    
    func testAll() {
        XCTAssertEqual(repo.all().count, 0)
    }
    
    func testSave() {
        let model = BasicTestModel(id: 1, name: "foo")
        let saved = repo.save(model)
        XCTAssertEqual(model.id, saved.id)
        XCTAssertEqual(model.name, saved.name)
    }
    
    func testSaveExisting() {
        loadRepo()
        let retrieved = repo.get(id: 1)!
        retrieved.name = "new foo"
        _ = repo.save(retrieved)
        
        let updated = repo.get(id: 1)!
        XCTAssertEqual(updated.name, "new foo")
    }
    
    func testGet() {
        loadRepo()
        let retrieved = repo.get(id: 1)
        XCTAssertNotNil(retrieved)
        XCTAssertEqual(retrieved!.id!, 1)
        XCTAssertEqual(retrieved!.name, "foo-1")
        
        let ten = repo.get(id: 10)
        XCTAssertNotNil(ten)
        XCTAssertEqual(ten!.id!, 10)
        XCTAssertEqual(ten!.name, "foo-10")
    }
    
    func testDelete() {
        loadRepo()
        XCTAssertEqual(repo.all().count, 25)
        
        repo.delete(id: 10)
        XCTAssertEqual(repo.all().count, 24)
        
        repo.delete(id: 30)
        XCTAssertEqual(repo.all().count, 24)
        
    }
    
    private func loadRepo(_ start: Int = 1, _ end: Int = 25) {
        let models: [BasicTestModel] = (start...end).map { i in
            let name = "foo-\(i)"
            return BasicTestModel(id: i, name: name)
        }
        
        _ = models.map { _ = repo.save($0) }
    }
    
    static var allTests = [
        ("testAll", testAll),
        ("testSave", testSave),
        ("testGet", testGet),
        ("testDelete", testDelete),
        ("testSaveExisting", testSaveExisting)
    ]
}
