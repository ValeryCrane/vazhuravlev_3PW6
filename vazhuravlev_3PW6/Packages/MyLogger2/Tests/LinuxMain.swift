import XCTest

import MyLogger2Tests

var tests = [XCTestCaseEntry]()
tests += MyLogger2Tests.allTests()
XCTMain(tests)
