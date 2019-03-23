import Foundation

class BowlingGame {
    private var frames = [Frame]()

    var score: Int {
        let emptyLastNextFrame = Frame(number: frames.count + 1)
        let nextFrames = frames.dropFirst() + [emptyLastNextFrame]
        let framesWithNextFrames = zip(frames, nextFrames)
        let frameScores = framesWithNextFrames.map { (frame, nextFrame) in
            frame.score(nextFrame: nextFrame) }
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
