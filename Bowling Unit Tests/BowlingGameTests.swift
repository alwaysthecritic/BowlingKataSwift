import XCTest

class GameTests: XCTestCase {
    var game: BowlingGame!

    override func setUp() {
        game = BowlingGame()
    }

    func testEmptyGame() {
        XCTAssert(game.score == 0)
    }

    func testOneBall() throws {
        try game.roll(7)
        XCTAssertEqual(game.score, 7)
    }

    func testTwoBalls() throws {
        try game.roll(7)
        try game.roll(2)
        XCTAssertEqual(game.score, 9)
    }

    func testThreeBalls() throws {
        try game.roll(7)
        try game.roll(2)

        try game.roll(4)
        XCTAssertEqual(game.score, 13)
    }

    func testFourBalls() throws {
        try game.roll(7)
        try game.roll(2)

        try game.roll(4)
        try game.roll(6)
        XCTAssertEqual(game.score, 19)
    }

    func testSpareWithNextBall() throws {
        try game.roll(4)
        try game.roll(6)

        try game.roll(3)
        XCTAssertEqual(game.score, 16)
    }

    func testWholeGameNoMultiStrikes() throws {
        // qq want a way to express the test like a scorecard so you can _see_ it.
        // Problem is that the score for spare/strike frames changes as subsequent balls are bowled
        // so the classic scorecard is too static to capture that.

        // spare
        try game.roll(4)
        XCTAssertEqual(game.score, 4)
        try game.roll(6)
        XCTAssertEqual(game.score, 10)

        try game.roll(3)
        XCTAssertEqual(game.score, 16)
        try game.roll(3)
        XCTAssertEqual(game.score, 19)

        try game.roll(4)
        XCTAssertEqual(game.score, 23)
        try game.roll(1)
        XCTAssertEqual(game.score, 24)

        // spare
        try game.roll(5)
        XCTAssertEqual(game.score, 29)
        try game.roll(5)
        XCTAssertEqual(game.score, 34)

        // strike
        try game.roll(10)
        XCTAssertEqual(game.score, 54)

        // spare
        try game.roll(8)
        XCTAssertEqual(game.score, 70)
        try game.roll(2)
        XCTAssertEqual(game.score, 74)

        try game.roll(7)
        XCTAssertEqual(game.score, 88)
        try game.roll(0)
        XCTAssertEqual(game.score, 88)

        try game.roll(0)
        XCTAssertEqual(game.score, 88)
        try game.roll(0)
        XCTAssertEqual(game.score, 88)

        try game.roll(0)
        XCTAssertEqual(game.score, 88)
        try game.roll(9)
        XCTAssertEqual(game.score, 97)

        try game.roll(2)
        XCTAssertEqual(game.score, 99)
        try game.roll(4)
        XCTAssertEqual(game.score, 103)
    }

    // Multiple strikes in a row is interesting because the scoring needs to look two frames ahead.
    func testWholeGameMultiStrikes() throws {
        // spare
        try game.roll(4)
        XCTAssertEqual(game.score, 4)
        try game.roll(6)
        XCTAssertEqual(game.score, 10)

        try game.roll(3)
        XCTAssertEqual(game.score, 16)
        try game.roll(3)
        XCTAssertEqual(game.score, 19)

        try game.roll(4)
        XCTAssertEqual(game.score, 23)
        try game.roll(1)
        XCTAssertEqual(game.score, 24)

        // spare
        try game.roll(5)
        XCTAssertEqual(game.score, 29)
        try game.roll(5)
        XCTAssertEqual(game.score, 34)

        // strike
        try game.roll(10)
        XCTAssertEqual(game.score, 54)

        // strike
        try game.roll(10)
        XCTAssertEqual(game.score, 74)

        // strike
        try game.roll(10)
        XCTAssertEqual(game.score, 104)

        try game.roll(5)
        XCTAssertEqual(game.score, 119)
        try game.roll(4)
        XCTAssertEqual(game.score, 127)

        try game.roll(0)
        XCTAssertEqual(game.score, 127)
        try game.roll(9)
        XCTAssertEqual(game.score, 136)

        try game.roll(2)
        XCTAssertEqual(game.score, 138)
        try game.roll(4)
        XCTAssertEqual(game.score, 142)
    }

    func testPerfectGame() throws {
        try game.roll(10)
        XCTAssertEqual(game.score, 10)

        try game.roll(10)
        XCTAssertEqual(game.score, 30)

        try game.roll(10)
        XCTAssertEqual(game.score, 60)

        try game.roll(10)
        XCTAssertEqual(game.score, 90)

        try game.roll(10)
        XCTAssertEqual(game.score, 120)

        try game.roll(10)
        XCTAssertEqual(game.score, 150)

        try game.roll(10)
        XCTAssertEqual(game.score, 180)

        try game.roll(10)
        XCTAssertEqual(game.score, 210)

        try game.roll(10)
        XCTAssertEqual(game.score, 240)

        // 10th frame has three balls but the last two only count for adding to the initial strike
        try game.roll(10)
        XCTAssertEqual(game.score, 270)
        try game.roll(10)
        XCTAssertEqual(game.score, 290)
        try game.roll(10)
        XCTAssertEqual(game.score, 300)
    }
}
