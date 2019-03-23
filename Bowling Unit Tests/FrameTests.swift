import XCTest

class FrameTests: XCTestCase {

    func testOneBall() {
        let frame = Frame(ball1: 4, ball2: nil, subsequentBalls: [])
        XCTAssertEqual(frame.score, 4)
    }

    func testTwoBalls() {
        let frame = Frame(ball1: 4, ball2: 5, subsequentBalls: [])
        XCTAssertEqual(frame.score, 9)
    }

    func testSpare() {
        let frame = Frame(ball1: 3, ball2: 7, subsequentBalls: [])
        XCTAssertEqual(frame.score, 10)
    }

    func testSpareWithNextBall() {
        let frame = Frame(ball1: 3, ball2: 7, subsequentBalls: [4])
        XCTAssertEqual(frame.score, 14)
    }

    func testSpareWithTwoMoreBallsUsesOnlyFirst() {
        let frame = Frame(ball1: 3, ball2: 7, subsequentBalls: [4, 3])
        XCTAssertEqual(frame.score, 14)
    }

    func testStrikeNoMoreBallsYet() {
        let frame = Frame(ball1: 10, ball2: nil, subsequentBalls: [])
        XCTAssertEqual(frame.score, 10)
    }

    func testStrikeOneMoreBall() {
        let frame = Frame(ball1: 10, ball2: nil, subsequentBalls: [5])
        XCTAssertEqual(frame.score, 15)
    }

    func testStrikeTwoMoreBalls() {
        let frame = Frame(ball1: 10, ball2: nil, subsequentBalls: [5, 4])
        XCTAssertEqual(frame.score, 19)
    }

    func testStrikeTwoMoreStrikes() {
        let frame = Frame(ball1: 10, ball2: nil, subsequentBalls: [10, 10])
        XCTAssertEqual(frame.score, 30)
    }
}
