import XCTest

class framesForBallsTests: XCTestCase {

    func testNoBalls() {
        let frames = framesForBalls([])
        XCTAssertEqual(frames, [])
    }

    func testOneBall() {
        let frames = framesForBalls([5])
        XCTAssertEqual(frames, [Frame(ball1: 5, ball2: nil, subsequentBalls: [])])
    }

    func testOneFrameTwoBalls() {
        let frames = framesForBalls([5, 3])
        XCTAssertEqual(frames, [Frame(ball1: 5, ball2: 3, subsequentBalls: [])])
    }

    func testTwoFramesThreeBalls() {
        let frames = framesForBalls([5, 3, 7])
        XCTAssertEqual(frames,
                       [Frame(ball1: 5, ball2: 3, subsequentBalls: [7]),
                        Frame(ball1: 7, ball2: nil, subsequentBalls: [])])
    }

    func testStrikes() {
        let frames = framesForBalls([10, 10, 10])
        XCTAssertEqual(frames,
                       [Frame(ball1: 10, ball2: nil, subsequentBalls: [10, 10]),
                        Frame(ball1: 10, ball2: nil, subsequentBalls: [10]),
                        Frame(ball1: 10, ball2: nil, subsequentBalls: [])])
    }

    func testPerfectGame() {
        let frames = framesForBalls([10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10])
        XCTAssertEqual(frames,
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
