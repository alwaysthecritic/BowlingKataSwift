import XCTest

class FrameScoreTests: XCTestCase {

    func testScoringOneBall() {
        let frame = Frame(ball1: 4, ball2: nil, subsequentBalls: [])
        XCTAssertEqual(frame.score, 4)
    }

    func testScoringTwoBalls() {
        let frame = Frame(ball1: 4, ball2: 5, subsequentBalls: [])
        XCTAssertEqual(frame.score, 9)
    }

    func testScoringSpare() {
        let frame = Frame(ball1: 3, ball2: 7, subsequentBalls: [])
        XCTAssertEqual(frame.score, 10)
    }

    func testScoringSpareWithNextBall() {
        let frame = Frame(ball1: 3, ball2: 7, subsequentBalls: [4])
        XCTAssertEqual(frame.score, 14)
    }

    func testScoringSpareWithTwoMoreBallsUsesOnlyFirst() {
        let frame = Frame(ball1: 3, ball2: 7, subsequentBalls: [4, 3])
        XCTAssertEqual(frame.score, 14)
    }

    func testScoringStrikeNoMoreBallsYet() {
        let frame = Frame(ball1: 10, ball2: nil, subsequentBalls: [])
        XCTAssertEqual(frame.score, 10)
    }

    func testScoringStrikeOneMoreBall() {
        let frame = Frame(ball1: 10, ball2: nil, subsequentBalls: [5])
        XCTAssertEqual(frame.score, 15)
    }

    func testScoringStrikeTwoMoreBalls() {
        let frame = Frame(ball1: 10, ball2: nil, subsequentBalls: [5, 4])
        XCTAssertEqual(frame.score, 19)
    }

    func testScoringStrikeTwoMoreStrikes() {
        let frame = Frame(ball1: 10, ball2: nil, subsequentBalls: [10, 10])
        XCTAssertEqual(frame.score, 30)
    }
}
