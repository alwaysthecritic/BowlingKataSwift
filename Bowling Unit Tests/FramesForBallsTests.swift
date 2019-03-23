import XCTest

class FramesForBallsTests: XCTestCase {

    func testFramesFromNoBalls() {
        XCTAssertEqual(framesForBalls([]), [])
    }

    func testFrameFromOneBall() {
        XCTAssertEqual(framesForBalls([5]),
                       [Frame(ball1: 5, ball2: nil, subsequentBalls: [])])
    }

    func testOneFrameTwoBalls() {
        XCTAssertEqual(framesForBalls([5, 3]),
                       [Frame(ball1: 5, ball2: 3, subsequentBalls: [])])
    }

    func testTwoFramesThreeBalls() {
        XCTAssertEqual(framesForBalls([5, 3, 7]),
                       [Frame(ball1: 5, ball2: 3, subsequentBalls: [7]),
                        Frame(ball1: 7, ball2: nil, subsequentBalls: [])])
    }

    func testStrikes() {
        XCTAssertEqual(framesForBalls([10, 10, 10]),
                       [Frame(ball1: 10, ball2: nil, subsequentBalls: [10, 10]),
                        Frame(ball1: 10, ball2: nil, subsequentBalls: [10]),
                        Frame(ball1: 10, ball2: nil, subsequentBalls: [])])
    }

    func testPerfectGame() {
        XCTAssertEqual(framesForBalls([10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10]),
                       [Frame(ball1: 10, ball2: nil, subsequentBalls: [10, 10]),
                        Frame(ball1: 10, ball2: nil, subsequentBalls: [10, 10]),
                        Frame(ball1: 10, ball2: nil, subsequentBalls: [10, 10]),
                        Frame(ball1: 10, ball2: nil, subsequentBalls: [10, 10]),
                        Frame(ball1: 10, ball2: nil, subsequentBalls: [10, 10]),
                        Frame(ball1: 10, ball2: nil, subsequentBalls: [10, 10]),
                        Frame(ball1: 10, ball2: nil, subsequentBalls: [10, 10]),
                        Frame(ball1: 10, ball2: nil, subsequentBalls: [10, 10]),
                        Frame(ball1: 10, ball2: nil, subsequentBalls: [10, 10]),
                        Frame(ball1: 10, ball2: nil, subsequentBalls: [10, 10])])
    }
}
