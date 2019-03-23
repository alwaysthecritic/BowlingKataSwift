# Bowling Kata in Swift

## Author

Sam Carr
Twitter: @justthesam

## Description

This is a solution to the classic Bowling kata, in Swift.

Actually I experimented with a couple of solutions and got sucked into polishing things up further as a learning exercise, so this git repo presents the evolution of the solution.

## Usage

The XCode project has a single target, which just runs unit tests to exercise the code.

## Evolution

The following git tags capture various states.

### tag: initial_solution

With each ball rolled, either add it to an existing Frame or create a new one. We keep the growing array of Frame objects. To calculate the score, we ask each Frame for its score and add them all up. But each Frame needs to know about subsequent frames (if they exist yet) to handle spares and strikes. However it wasn't until I added a test with multiple strikes in a row that I realised you need the next two frames in some cases. The code was never updated to solve this problem, so those tests still fail. I decided to rethink the solution from scratch as it was feeling too fiddly already.

Another source of irritation is that each Frame tries to handle the tenth frame oddities by having up to three balls. This didn't work out well and feels too messy.

### tag: second_solution

I tried again with a completely different tactic: now the BowlingGame just keeps a trivial array of the individual ball scores. Each rolled ball is just added as an int to that array. Every time the score is required, it works out afresh how to break the balls down into frames and adds up the frame scores. Each frame can still score itself, but now it has just one or two balls (never three), and an array of 'subsequentBalls' (not frames) so that it can get the numbers it needs for completing spares and strikes. The three-ball frame idea is gone and it rather neatly turns out that handling the tenth frame does not need _any_ special code at all in the Frame implementation - it just works.

Overall it's surprisingly short and simple and feels so much better than the initial solution. In particular the Frame scoring code is really short and pretty much a direct, simple statement of the scoring rules that we understand in our heads. Achieving this simple directness is, in my opinion, the holy grail of coding! The tests also end up quite a bit simpler, which is part of the nice result. It all goes to show that what might have seemed like necessary complexity in the initial solution (e.g. tenth frame handling) may actually be incidental complexity that can be eradicated with a better approach.

Note that I moved all the code into the BowlingGame.swift file because it's sufficiently short and it helps to see how it all works together. Also, this solution does not perform any checks for invalid balls like the first one did, partly because the new approach doesn't demand it in quite the same way. It could be added in again fairly easily I think.

Perhaps controversially there is a standalone function (not in any class/struct) for turning the balls array into Frames. This was largely because I wanted to unit test that function and I couldn't do that if it was private in BowlingGame. I'm glad I did unit test it directly (instead of as part of the black box of BowlingGame) as it has enough complexity that it really helped to get it right.
