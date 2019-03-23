import XCTest

class framesForBallsTests: XCTestCase {

    func testNoBalls() {
        let frames = framesForBalls([])
        XCTAssertEqual(frames.count, 0)
    }

    func testOneBall() {
        let frames = framesForBalls([5])
        XCTAssertEqual(frames.count, 1)
        XCTAssertEqual(frames.first!, Frame(ball1: 5, ball2: nil, subsequentBalls: []))
    }

    func testOneFrameTwoBalls() {
        let frames = framesForBalls([5, 3])
        XCTAssertEqual(frames.count, 1)
        XCTAssertEqual(frames.first!, Frame(ball1: 5, ball2: 3, subsequentBalls: []))
    }

    func testTwoFramesThreeBalls() {
        let frames = framesForBalls([5, 3, 7])
        XCTAssertEqual(frames.count, 2)
        XCTAssertEqual(frames[0], Frame(ball1: 5, ball2: 3, subsequentBalls: [7]))
        XCTAssertEqual(frames[1], Frame(ball1: 7, ball2: nil, subsequentBalls: []))
    }

    func testStrikes() {
        let frames = framesForBalls([10, 10, 10])
        XCTAssertEqual(frames.count, 3)
        XCTAssertEqual(frames[0], Frame(ball1: 10, ball2: nil, subsequentBalls: [10, 10]))
        XCTAssertEqual(frames[1], Frame(ball1: 10, ball2: nil, subsequentBalls: [10]))
        XCTAssertEqual(frames[2], Frame(ball1: 10, ball2: nil, subsequentBalls: []))
    }

    func testPerfectGame() {
        let frames = framesForBalls([10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10])
        XCTAssertEqual(frames.count, 10)
        XCTAssertEqual(frames[0], Frame(ball1: 10, ball2: nil, subsequentBalls: [10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10]))
        XCTAssertEqual(frames[1], Frame(ball1: 10, ball2: nil, subsequentBalls: [10, 10, 10, 10, 10, 10, 10, 10, 10, 10]))
        XCTAssertEqual(frames[2], Frame(ball1: 10, ball2: nil, subsequentBalls: [10, 10, 10, 10, 10, 10, 10, 10, 10]))
        XCTAssertEqual(frames[3], Frame(ball1: 10, ball2: nil, subsequentBalls: [10, 10, 10, 10, 10, 10, 10, 10]))
        XCTAssertEqual(frames[4], Frame(ball1: 10, ball2: nil, subsequentBalls: [10, 10, 10, 10, 10, 10, 10]))
        XCTAssertEqual(frames[5], Frame(ball1: 10, ball2: nil, subsequentBalls: [10, 10, 10, 10, 10, 10]))
        XCTAssertEqual(frames[6], Frame(ball1: 10, ball2: nil, subsequentBalls: [10, 10, 10, 10, 10]))
        XCTAssertEqual(frames[7], Frame(ball1: 10, ball2: nil, subsequentBalls: [10, 10, 10, 10]))
        XCTAssertEqual(frames[8], Frame(ball1: 10, ball2: nil, subsequentBalls: [10, 10, 10]))
        XCTAssertEqual(frames[9], Frame(ball1: 10, ball2: nil, subsequentBalls: [10, 10]))
    }
}
