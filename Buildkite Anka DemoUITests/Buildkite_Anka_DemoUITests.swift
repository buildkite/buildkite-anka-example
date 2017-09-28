import XCTest

class Buildkite_Anka_DemoUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false

        XCUIApplication().launch()
    }
    
    func testExample() {
        // Do something stupid
        XCUIApplication().images["Logo"].tap()
        
        XCTAssert(1 == 1)
    }
    
}
