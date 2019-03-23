# Bowling Kata in Swift

## Author

Sam Carr
Twitter: @justthesam

## Description

This is a solution to the classic Bowling kata, in Swift.

Actually I experimented with a couple of solutions and got sucked into polishing things up further as a learning exercise, so this git repo presents the evolution of the solution.

## Evolution

The following git tags capture various states.

### tag: initial_solution

With each ball rolled, either add it to an existing Frame or create a new one. We keep the growing array of Frame objects. To calculate the score, we ask each Frame for its score and add them all up. But each Frame needs to know about subsequent frames (if they exist yet) to handle spares and strikes. However it wasn't until I added a test with multiple strikes in a row that I realised you need the next two frames in some cases. The code was never updated to solve this problem, so those tests still fail. I decided to rethink the solution from scratch as it was feeling too fiddly already.

Another source of irritation is that each Frame tries to handle the tenth frame oddities by having up to three balls. This didn't work out well and feels too messy.

