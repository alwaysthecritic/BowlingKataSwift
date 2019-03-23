import Foundation

// Tactic is to build up array of Frames as each ball is rolled.
// Each Frame can score itself but needs access to subsequent frames to do so.
class BowlingGame {
    private var frames = [Frame]()

    var score: Int {
        let emptyLastNextFrame = Frame(number: frames.count + 1)
        let nextFrames = frames.dropFirst() + [emptyLastNextFrame]
        let framesWithNextFrames = zip(frames, nextFrames)
        let frameScores = framesWithNextFrames.map { (frame, nextFrame) in
            // TODO unfortunately, just the next frame is not enough when there are multiple
            // strikes in a row, where we may need the next two frames.
            frame.score(nextFrame: nextFrame)
        }
        return frameScores.reduce(0, +)
    }

    func roll(_ ball: Int) throws {
        if let lastFrame = frames.last {
            if (lastFrame.canHaveMoreBalls) {
                try lastFrame.roll(ball)
            } else {
                let newFrame = addNewFrame(number: lastFrame.frameNumber + 1)
                try newFrame.roll(ball)
            }
        } else {
            let newFrame = addNewFrame(number: 1)
            try newFrame.roll(ball)
        }
    }

    private func addNewFrame(number: Int) -> Frame {
        let newFrame = Frame(number: number)
        frames.append(newFrame)
        return newFrame
    }
}
