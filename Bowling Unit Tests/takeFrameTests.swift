import XCTest

class framesForBallsTests: XCTestCase {

    func testNoBalls() {
        XCTAssertNil(takeFrame([]))
    }

    func testOneBall() {
        let (frame, remainingBalls) = takeFrame([5])!
        XCTAssertEqual(frame, Frame(ball1: 5, ball2: nil, subsequentBalls: []))
        XCTAssertEqual(remainingBalls, [])
    }

    func testTwoBalls() {
        let (frame, remainingBalls) = takeFrame([5, 3])!
        XCTAssertEqual(frame, Frame(ball1: 5, ball2: 3, subsequentBalls: []))
        XCTAssertEqual(remainingBalls, [])
    }

    func testThreeBalls() {
        let (frame, remainingBalls) = takeFrame([5, 3, 7])!
        XCTAssertEqual(frame, Frame(ball1: 5, ball2: 3, subsequentBalls: [7]))
        XCTAssertEqual(remainingBalls, [7])
    }

    func testSpare() {
        let (frame, remainingBalls) = takeFrame([8, 2, 4, 5])!
        XCTAssertEqual(frame, Frame(ball1: 8, ball2: 2, subsequentBalls: [4, 5]))
        XCTAssertEqual(remainingBalls, [4, 5])
    }

    func testStrikes() {
        let (frame, remainingBalls) = takeFrame([10, 10, 10, 10])!
        XCTAssertEqual(frame, Frame(ball1: 10, ball2: nil, subsequentBalls: [10, 10]))
        XCTAssertEqual(remainingBalls, [10, 10, 10])
    }
}
