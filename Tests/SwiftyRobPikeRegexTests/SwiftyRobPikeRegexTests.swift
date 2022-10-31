import XCTest
@testable import SwiftyRobPikeRegex

final class SwiftyRobPikeRegexTests: XCTestCase {
    func testEmptyBoth() {
		XCTAssertTrue(SwiftyRobPikeRegex.match(regexp: "", text: ""))
    }

	func testEmptyRegex() {
		XCTAssertTrue(SwiftyRobPikeRegex.match(regexp: "", text: "foo"))
	}

	func testEmptyText() {
		XCTAssertFalse(SwiftyRobPikeRegex.match(regexp: "foo", text: ""))
	}

	func testLiteralExact() {
		XCTAssertTrue(SwiftyRobPikeRegex.match(regexp: "foo", text: "foo"))
	}

	func testLiteralSearch() {
		XCTAssertTrue(SwiftyRobPikeRegex.match(regexp: "foo", text: "A food truck"))
	}

	func testLiteralNo() {
		XCTAssertFalse(SwiftyRobPikeRegex.match(regexp: "foo", text: "foes"))
	}

	func testStartOnlyEmpty() {
		XCTAssertTrue(SwiftyRobPikeRegex.match(regexp: "^", text: ""))
	}

	func testStartOnlySome() {
		XCTAssertTrue(SwiftyRobPikeRegex.match(regexp: "^", text: "foo"))
	}

	func testStartExact() {
		XCTAssertTrue(SwiftyRobPikeRegex.match(regexp: "^foo", text: "foo"))
	}

	func testStartInexact() {
		XCTAssertTrue(SwiftyRobPikeRegex.match(regexp: "^foo", text: "food"))
	}

	func testStartIncomplete() {
		XCTAssertFalse(SwiftyRobPikeRegex.match(regexp: "^foo", text: "fo"))
	}

	func testStartNo1() {
		XCTAssertFalse(SwiftyRobPikeRegex.match(regexp: "^foo", text: "xfoo"))
	}

	func testStartNo2() {
		XCTAssertFalse(SwiftyRobPikeRegex.match(regexp: "^foo", text: "A food truck"))
	}

	func testStartEndEmpty() {
		XCTAssertTrue(SwiftyRobPikeRegex.match(regexp: "^$", text: ""))
	}

	func testStartEndSome() {
		XCTAssertFalse(SwiftyRobPikeRegex.match(regexp: "^$", text: "x"))
	}

	func testStartDotEndZero() {
		XCTAssertFalse(SwiftyRobPikeRegex.match(regexp: "^.$", text: ""))
	}

	func testStartDotEndOne() {
		XCTAssertTrue(SwiftyRobPikeRegex.match(regexp: "^.$", text: "x"))
	}

	func testStartDotEndTwo() {
		XCTAssertFalse(SwiftyRobPikeRegex.match(regexp: "^.$", text: "xy"))
	}
}
