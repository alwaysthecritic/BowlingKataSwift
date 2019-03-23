import Foundation

enum FrameError: Error {
    case TooManyBalls
    case CantHaveThirdBall
}

class Frame {
    var frameNumber: Int
    var ball1: Int?
    var ball2: Int?
    var ball3: Int?

    init(number frameNumber: Int, ball1: Int? = nil, ball2: Int? = nil, ball3: Int? = nil) {
        self.frameNumber = frameNumber
        self.ball1 = ball1
        self.ball2 = ball2
        self.ball3 = ball3
    }

    var oneBallScore: Int { return (ball1 ?? 0) }

    var twoBallScore: Int { return oneBallScore + (ball2 ?? 0) }

    var threeBallScore: Int { return twoBallScore + (ball3 ?? 0) }

    var isStrike: Bool { return (ball1 != nil) && (ball1! == 10) }

    var isSpare: Bool { return (ball1 != nil) && (ball2 != nil) && (ball1! + ball2! == 10) }

    var ball3Allowed: Bool { return (frameNumber == 10) && (isStrike || isSpare) }

    var canHaveMoreBalls: Bool {
        return ((frameNumber < 10) && (ball2 == nil && !isStrike))
            || ((frameNumber == 10) && (ball2 == nil || ball3Allowed))
    }

    func score(nextFrame: Frame? = nil) -> Int {
        let simpleScore = threeBallScore
        if let nextFrame = nextFrame {
            if (isStrike) {
                // TODO This fails to take account of multiple strikes in a row, where you need
                // to look at next two frames.
                return simpleScore + nextFrame.twoBallScore
            } else if (isSpare) {
                return simpleScore + nextFrame.oneBallScore
            }
        }
        return simpleScore
    }

    @discardableResult
    func roll(_ score: Int) throws -> Frame {
        if (ball1 == nil) {
            ball1 = score
        } else if (ball2 == nil) {
            ball2 = score
        } else if (ball3 == nil) {
            if (ball3Allowed) {
                ball3 = score
            } else {
                throw FrameError.CantHaveThirdBall
            }
        } else {
            throw FrameError.TooManyBalls
        }
        return self
    }
}
