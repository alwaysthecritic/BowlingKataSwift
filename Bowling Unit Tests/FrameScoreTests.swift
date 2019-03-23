import XCTest

fileprivate let cases:
    [(ball1: Int, ball2: Int?, subsequentBalls: [Int], expectedScore: Int, line: UInt)] = [
//   b1  b2   subsBalls score
    (4,  nil, [],       4,    #line),
    (4,  5,   [],       9,    #line),
    (3,  7,   [],       10,   #line),
    (3,  7,   [4],      14,   #line),
    (3,  7,   [4, 3],   14,   #line),
    (10, nil, [],       10,   #line),
    (10, nil, [5],      15,   #line),
    (10, nil, [5, 4],   19,   #line),
    (10, 10,  [10],     30,   #line)]

class FrameScoreTests: XCTestCase {

    func testFrameScores() {
        cases.forEach { (ball1, ball2, subsequentBalls, expectedScore, line) in
            let frame = Frame(ball1: ball1, ball2: ball2, subsequentBalls: subsequentBalls)
            XCTAssertEqual(frame.score, expectedScore, line: line)
        }
    }
}
