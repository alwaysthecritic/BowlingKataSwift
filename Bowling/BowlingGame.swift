import Foundation

// Tactic is to simply record the balls in an array, and when the score is required, figure out
// how to break the balls into frames and score them.
class BowlingGame {
    private var balls: [Int] = []

    func roll(_ ball: Int) {
        balls.append(ball)
    }

    var score: Int { return frames.map({ $0.score }).reduce(0, +) }

    var frames: [Frame] { return framesForBalls(balls) }
}

// Recursively build Frames by taking balls from the array until none left.
// This is a standalone function for testability.
func framesForBalls(_ balls: [Int], framesSoFar: [Frame] = [Frame]()) -> [Frame] {
    if (balls.isEmpty || framesSoFar.count == 10) {
        return framesSoFar
    }

    var remainingBalls = balls
    let ball1 = remainingBalls.removeFirst()
    let ball2 = (ball1 != 10 && !remainingBalls.isEmpty) ? remainingBalls.removeFirst() : nil

    let frame = Frame(ball1: ball1, ball2: ball2, subsequentBalls: Array(remainingBalls.prefix(2)))

    return framesForBalls(remainingBalls, framesSoFar: (framesSoFar + [frame]))
}

// By modelling a frame with a subsequentBalls array, we don't need to handle the tenth frame
// any differently in here and the scoring logic is simple and easily tested.
struct Frame: Equatable {
    let ball1: Int
    let ball2: Int?
    let subsequentBalls: [Int]

    var isStrike: Bool { return ball1 == 10 }

    var isSpare: Bool { return simpleScore == 10}

    var simpleScore: Int { return ball1 + (ball2 ?? 0) }

    var score: Int {
        if (isStrike) {
            return simpleScore + subsequentBalls.prefix(2).reduce(0, +)
        } else if (isSpare) {
            return simpleScore + (subsequentBalls.first ?? 0)
        } else {
            return simpleScore
        }
    }
}
