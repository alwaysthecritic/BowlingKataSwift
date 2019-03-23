import XCTest

class FramesForBallsTests: XCTestCase {

    func testFramesFromNoBalls() {
        XCTAssertEqual(framesForBalls([]), [])
    }

    func testFramesForOneBall() {
        XCTAssertEqual(framesForBalls([5]),
                       [Frame(ball1: 5, ball2: nil, subsequentBalls: [])])
    }

    func testOneFrameForTwoBalls() {
        XCTAssertEqual(framesForBalls([5, 3]),
                       [Frame(ball1: 5, ball2: 3, subsequentBalls: [])])
    }

    func testTwoFramesForThreeBalls() {
        XCTAssertEqual(framesForBalls([5, 3, 7]),
                       [Frame(ball1: 5, ball2: 3, subsequentBalls: [7]),
                        Frame(ball1: 7, ball2: nil, subsequentBalls: [])])
    }

    func testThreeFramesForThreeStrikes() {
        XCTAssertEqual(framesForBalls([10, 10, 10]),
                       [Frame(ball1: 10, ball2: nil, subsequentBalls: [10, 10]),
                        Frame(ball1: 10, ball2: nil, subsequentBalls: [10]),
                        Frame(ball1: 10, ball2: nil, subsequentBalls: [])])
    }

    func testFramesForPerfectGame() {
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
