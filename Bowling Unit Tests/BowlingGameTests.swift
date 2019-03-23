import XCTest

class GameTests: XCTestCase {
    var game: BowlingGame!

    override func setUp() {
        game = BowlingGame()
    }

    func testEmptyGame() {
        XCTAssert(game.score == 0)
    }

    func testWholeGame() {
        // spare
        roll(4, assertScore: 4)
        roll(6, assertScore: 10)

        roll(3, assertScore: 16)
        roll(3, assertScore: 19)

        roll(4, assertScore: 23)
        roll(1, assertScore: 24)

        // spare
        roll(5, assertScore: 29)
        roll(5, assertScore: 34)

        // strike
        roll(10, assertScore: 54)

        // spare
        roll(8, assertScore: 70)
        roll(2, assertScore: 74)

        roll(7, assertScore: 88)
        roll(0, assertScore: 88)

        roll(0, assertScore: 88)
        roll(0, assertScore: 88)

        roll(0, assertScore: 88)
        roll(9, assertScore: 97)

        roll(2, assertScore: 99)
        roll(4, assertScore: 103)
    }

    // Multiple strikes in a row is interesting because the scoring needs to look two frames ahead.
    func testPerfectGame() throws {
        roll(10, assertScore: 10)
        roll(10, assertScore: 30)
        roll(10, assertScore: 60)
        roll(10, assertScore: 90)
        roll(10, assertScore: 120)
        roll(10, assertScore: 150)
        roll(10, assertScore: 180)
        roll(10, assertScore: 210)
        roll(10, assertScore: 240)
        // 10th frame has three balls but the last two only count for adding to the initial strike
        roll(10, assertScore: 270)
        roll(10, assertScore: 290)
        roll(10, assertScore: 300)
    }

    private func roll(_ ball: Int, assertScore score: Int,
                      file: StaticString = #file, line: UInt = #line) {
        game.roll(ball)
        XCTAssertEqual(game.score, score, file: file, line: line)
    }
}
