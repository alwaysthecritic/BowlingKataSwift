import XCTest

class FrameTests: XCTestCase {

    func testEmptyFrame() {
        let frame = Frame(number: 1)
        XCTAssertEqual(frame.score(), 0)
    }

    func testOneBallFrame() {
        let frame = Frame(number: 1)
        XCTAssertEqual(try frame.roll(4).score(), 4)
    }

    func testTwoBallFrame() {
        let frame = Frame(number: 1)
        XCTAssertEqual(try frame.roll(4).score(), 4)
        XCTAssertEqual(try frame.roll(5).score(), 9)
    }

    func testThreeBallFrameNotAllowedIfNotTenthFrame() {
        let frame = Frame(number: 9)
        XCTAssertEqual(try frame.roll(4).score(), 4)
        XCTAssertEqual(try frame.roll(6).score(), 10)
        XCTAssertThrowsError(try frame.roll(3)) { error in
            XCTAssertEqual(error as! FrameError, FrameError.CantHaveThirdBall)
        }
    }

    func testThreeBallFrameNotAllowedIfTenthFrameAndNotSpareOrStrike() {
        let frame = Frame(number: 10)
        XCTAssertEqual(try frame.roll(4).score(), 4)
        XCTAssertEqual(try frame.roll(5).score(), 9)
        XCTAssertThrowsError(try frame.roll(3)) { error in
            XCTAssertEqual(error as! FrameError, FrameError.CantHaveThirdBall)
        }
    }

    func testThreeBallFrameSpare() {
        let frame = Frame(number: 10)
        XCTAssertEqual(try frame.roll(4).score(), 4)
        XCTAssertEqual(try frame.roll(6).score(), 10)
        XCTAssertEqual(try frame.roll(3).score(), 13)
    }

    func testThreeBallFrameStrike() {
        let frame = Frame(number: 10)
        XCTAssertEqual(try frame.roll(10).score(), 10)
        XCTAssertEqual(try frame.roll(3).score(), 13)
        XCTAssertEqual(try frame.roll(5).score(), 18)
    }

    func testNotSpareOrStrikeWithNextFrame() {
        let frame = Frame(number: 1)
        XCTAssertEqual(try frame.roll(4).score(), 4)
        XCTAssertEqual(try frame.roll(3).score(), 7)

        let nextFrame = Frame(number: 2, ball1: 4, ball2: 1)
        XCTAssertEqual(frame.score(nextFrame: nextFrame), 7)
    }

    func testSpareWithNextFrameEmpty() {
        let frame = Frame(number: 1)
        XCTAssertEqual(try frame.roll(4).score(), 4)
        XCTAssertEqual(try frame.roll(6).score(), 10)

        let nextFrame = Frame(number: 2)
        XCTAssertEqual(frame.score(nextFrame: nextFrame), 10)
    }

    func testSpareWithNextFrame() {
        let frame = Frame(number: 1)
        XCTAssertEqual(try frame.roll(4).score(), 4)
        XCTAssertEqual(try frame.roll(6).score(), 10)

        let nextFrame = Frame(number: 2, ball1: 4, ball2: 1)
        XCTAssertEqual(frame.score(nextFrame: nextFrame), 14)
    }

    func testStrikeWithNextFrameEmpty() {
        let frame = Frame(number: 1)
        XCTAssertEqual(try frame.roll(10).score(), 10)

        let nextFrame = Frame(number: 2)
        XCTAssertEqual(frame.score(nextFrame: nextFrame), 10)
    }

    func testStrikeWithNextFrame() {
        let frame = Frame(number: 1)
        XCTAssertEqual(try frame.roll(10).score(), 10)

        let nextFrame = Frame(number: 2, ball1: 4, ball2: 1)
        XCTAssertEqual(frame.score(nextFrame: nextFrame), 15)
    }

    func testStrikeWithNextFrameAsThreeBaller() {
        let frame = Frame(number: 9)
        XCTAssertEqual(try frame.roll(10).score(), 10)

        let nextFrame = Frame(number: 10, ball1: 4, ball2: 1, ball3: 2)
        XCTAssertEqual(frame.score(nextFrame: nextFrame), 15)
    }
}
