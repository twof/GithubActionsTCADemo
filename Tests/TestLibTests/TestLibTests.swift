import XCTest
@testable import TestLib
import ComposableArchitecture


final class TestLibTests: XCTestCase {
  @MainActor
  func testExample() throws {
    XCTAssertEqual(2 + 2, 4)
  }
}
