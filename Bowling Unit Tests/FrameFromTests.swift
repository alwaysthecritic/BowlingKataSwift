import XCTest

class FrameFromTests: XCTestCase {

    func testFrameFromNoBalls() {
        XCTAssertNil(Frame.nextFrom(balls: []))
    }

    func testFrameFromOneBall() {
        let (frame, remainingBalls) = Frame.nextFrom(balls:[5])!
        XCTAssertEqual(frame, Frame(ball1: 5, ball2: nil, subsequentBalls: []))
        XCTAssertEqual(remainingBalls, [])
    }

    func testFrameFromTwoBalls() {
        let (frame, remainingBalls) = Frame.nextFrom(balls:[5, 3])!
        XCTAssertEqual(frame, Frame(ball1: 5, ball2: 3, subsequentBalls: []))
        XCTAssertEqual(remainingBalls, [])
    }

    func testFrameFromThreeBalls() {
        let (frame, remainingBalls) = Frame.nextFrom(balls:[5, 3, 7])!
        XCTAssertEqual(frame, Frame(ball1: 5, ball2: 3, subsequentBalls: [7]))
        XCTAssertEqual(remainingBalls, [7])
    }

    func testFrameFromSpare() {
        let (frame, remainingBalls) = Frame.nextFrom(balls:[8, 2, 4, 5])!
        XCTAssertEqual(frame, Frame(ball1: 8, ball2: 2, subsequentBalls: [4, 5]))
        XCTAssertEqual(remainingBalls, [4, 5])
    }

    func testFrameFromStrikes() {
        let (frame, remainingBalls) = Frame.nextFrom(balls:[10, 10, 10, 10])!
        XCTAssertEqual(frame, Frame(ball1: 10, ball2: nil, subsequentBalls: [10, 10]))
        XCTAssertEqual(remainingBalls, [10, 10, 10])
    }
}
