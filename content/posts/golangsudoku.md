+++
title = 'Building a Sudoku Solver in Golang'
date = 2024-06-12T19:38:45-07:00
draft = false
+++
I used to like playing Sudoku. I used to have an app on my phone that would let me play Sudoku. I mostly used it during class whenever I was bored. I ended up getting to a point with the app where I ended up stuck on the really hard board, and I just couldn't figure it out. True Sudoku fans may tell you it's all about skill. In truth, it's really a truly simple algorithm. If only we had machines that let us think about very simple problems very efficiently. 

### Making a Sudoku solver
Sudoku boils down to a fairly simple algorithm.
1. Find an empty space
2. For all digits 1-9, try them in the space and see if it works given the rules of the board
3. When one works, go onto the next space
4. When you reach a contradiction, go back

Fundementally, this is the problem you solve when you do Sudoku by hand. When you boil it down to this, it's fairly boring.

### Why Golang
Because I wanted to. 

### Making it smarter than the average copy and paste
I also added a CLI interface for inputing a board state with a variety of methods, including CSV and by manual entry.

### Learnings
- Make your code more friendly to CLI interfacing. I should've probably made it so you can pass in the file path and have it automatically assume you want to use that file. That would make this useful in automated testing.
- I hate python. I love you curly braces. Curly braces are the language of god, tabs are the language of the devil.
- Sanitizing CSV input is hard sometimes. An extra space in the CSV file destroyed my processing. I couldn't figure out how to fix it. I will probably look back at it at somepoint.
- I hate python.

# Links and References
- [Sudoku Solver Python Guide](https://www.endyourif.com/building-a-sudoku-solver-in-python/)
- [Link to my repo](https://github.com/DWilson29/GoSudokuSolver)