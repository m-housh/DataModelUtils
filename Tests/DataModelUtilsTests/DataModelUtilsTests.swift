import XCTest
import DataModelUtils



final class DataModelUtilsTests: XCTestCase {
    
    func testValidations() {
        let model = TestDataModel()
        XCTAssertFalse(model.isValid)
        model.name = "foo"
        XCTAssert(model.isValid)
    }
    
    func testBasicValidations() {
        let model = BasicTestModel()
        XCTAssert(model.isValid)
    }
    
    func testMemoryRepository() {
        let repo = MemoryRepository(BasicTestModel.self)
        XCTAssertEqual(repo.all().count, 0)
    }

    static var allTests = [
        ("testValidations", testValidations),
        ("testBasicValidations", testBasicValidations),
    ]
}
