import Foundation

// Tactic is to simply record the balls in an array, and when the score is required, figure out
// how to break the balls into frames and score them.
class BowlingGame {
    private var balls: [Int] = []

    func roll(_ ball: Int) {
        balls.append(ball)
    }

    var score: Int {
        return frames.map({ $0.score }).reduce(0, +)
    }

    private var frames: [Frame] {
        var remainingBalls = balls
        var frames = [Frame]()
        while let (frame, ballsLeft) = Frame.nextFrom(balls: remainingBalls), frames.count < 10 {
            remainingBalls = ballsLeft
            frames.append(frame)
        }
        return frames
    }
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
            return simpleScore + subsequentBalls.prefix(1).reduce(0, +)
        } else {
            return simpleScore
        }
    }

    // Take balls from the front of the array to create a single frame if possible,
    // returning the frame and the remaining balls, or nil if no frame left.
    static func nextFrom(balls: [Int]) -> (frame: Frame, remainingBalls: [Int])? {
        guard balls.count >= 1 else {
            return nil
        }

        let ball1 = balls[0]
        let ball2 = (ball1 != 10 && balls.count >= 2) ? balls[1] : nil

        let remainingBalls = Array(balls.suffix(from: (ball2 == nil) ? 1 : 2))
        let frame = Frame(ball1: ball1, ball2: ball2, subsequentBalls: Array(remainingBalls.prefix(2)))
        return (frame, remainingBalls)
    }
}
