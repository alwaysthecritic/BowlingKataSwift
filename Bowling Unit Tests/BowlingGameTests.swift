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
        game.roll(7)
        XCTAssertEqual(game.score, 7)
    }

    func testTwoBalls() throws {
        game.roll(7)
        game.roll(2)
        XCTAssertEqual(game.score, 9)
    }

    func testThreeBalls() throws {
        game.roll(7)
        game.roll(2)

        game.roll(4)
        XCTAssertEqual(game.score, 13)
    }

    func testFourBalls() throws {
        game.roll(7)
        game.roll(2)

        game.roll(4)
        game.roll(6)
        XCTAssertEqual(game.score, 19)
    }

    func testSpareWithNextBall() {
        game.roll(4)
        game.roll(6)

        game.roll(3)
        XCTAssertEqual(game.score, 16)
    }

    func testWholeGameNoMultiStrikes() {
        // qq want a way to express the test like a scorecard so you can _see_ it.
        // Problem is that the score for spare/strike frames changes as subsequent balls are bowled
        // so the classic scorecard is too static to capture that.

        // spare
        game.roll(4)
        XCTAssertEqual(game.score, 4)
        game.roll(6)
        XCTAssertEqual(game.score, 10)

        game.roll(3)
        XCTAssertEqual(game.score, 16)
        game.roll(3)
        XCTAssertEqual(game.score, 19)

        game.roll(4)
        XCTAssertEqual(game.score, 23)
        game.roll(1)
        XCTAssertEqual(game.score, 24)

        // spare
        game.roll(5)
        XCTAssertEqual(game.score, 29)
        game.roll(5)
        XCTAssertEqual(game.score, 34)

        // strike
        game.roll(10)
        XCTAssertEqual(game.score, 54)

        // spare
        game.roll(8)
        XCTAssertEqual(game.score, 70)
        game.roll(2)
        XCTAssertEqual(game.score, 74)

        game.roll(7)
        XCTAssertEqual(game.score, 88)
        game.roll(0)
        XCTAssertEqual(game.score, 88)

        game.roll(0)
        XCTAssertEqual(game.score, 88)
        game.roll(0)
        XCTAssertEqual(game.score, 88)

        game.roll(0)
        XCTAssertEqual(game.score, 88)
        game.roll(9)
        XCTAssertEqual(game.score, 97)

        game.roll(2)
        XCTAssertEqual(game.score, 99)
        game.roll(4)
        XCTAssertEqual(game.score, 103)
    }

    // Multiple strikes in a row is interesting because the scoring needs to look two frames ahead.
    func testWholeGameMultiStrikes() {
        // spare
        game.roll(4)
        XCTAssertEqual(game.score, 4)
        game.roll(6)
        XCTAssertEqual(game.score, 10)

        game.roll(3)
        XCTAssertEqual(game.score, 16)
        game.roll(3)
        XCTAssertEqual(game.score, 19)

        game.roll(4)
        XCTAssertEqual(game.score, 23)
        game.roll(1)
        XCTAssertEqual(game.score, 24)

        // spare
        game.roll(5)
        XCTAssertEqual(game.score, 29)
        game.roll(5)
        XCTAssertEqual(game.score, 34)

        // strike
        game.roll(10)
        XCTAssertEqual(game.score, 54)

        // strike
        game.roll(10)
        XCTAssertEqual(game.score, 74)

        // strike
        game.roll(10)
        XCTAssertEqual(game.score, 104)

        game.roll(5)
        XCTAssertEqual(game.score, 119)
        game.roll(4)
        XCTAssertEqual(game.score, 127)

        game.roll(0)
        XCTAssertEqual(game.score, 127)
        game.roll(9)
        XCTAssertEqual(game.score, 136)

        game.roll(2)
        XCTAssertEqual(game.score, 138)
        game.roll(4)
        XCTAssertEqual(game.score, 142)
    }

    func testPerfectGame() throws {
        game.roll(10)
        XCTAssertEqual(game.score, 10)

        game.roll(10)
        XCTAssertEqual(game.score, 30)

        game.roll(10)
        XCTAssertEqual(game.score, 60)

        game.roll(10)
        XCTAssertEqual(game.score, 90)

        game.roll(10)
        XCTAssertEqual(game.score, 120)

        game.roll(10)
        XCTAssertEqual(game.score, 150)

        game.roll(10)
        XCTAssertEqual(game.score, 180)

        game.roll(10)
        XCTAssertEqual(game.score, 210)

        game.roll(10)
        XCTAssertEqual(game.score, 240)

        // 10th frame has three balls but the last two only count for adding to the initial strike
        game.roll(10)
        XCTAssertEqual(game.score, 270)
        game.roll(10)
        XCTAssertEqual(game.score, 290)
        game.roll(10)
        XCTAssertEqual(game.score, 300)
    }
}
