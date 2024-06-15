=begin
You are given an m x n matrix board containing letters 'X' and 'O', capture regions that are surrounded:

Connect: A cell is connected to adjacent cells horizontally or vertically.
Region: To form a region connect every 'O' cell.
Surround: The region is surrounded with 'X' cells if you can connect the region with 'X' cells and none of the region cells are on the edge of the board.

A surrounded region is captured by replacing all 'O's with 'X's in the input matrix board.

Example 1:

Input: board = [["X","X","X","X"],["X","O","O","X"],["X","X","O","X"],["X","O","X","X"]]
Output: [["X","X","X","X"],["X","X","X","X"],["X","X","X","X"],["X","O","X","X"]]

Explanation:
In the above diagram, the bottom region is not captured because it is on the edge of the board and cannot be surrounded.

Example 2:

Input: board = [["X"]]
Output: [["X"]]

Constraints:

m == board.length
n == board[i].length
1 <= m, n <= 200
board[i][j] is 'X' or 'O'.

=end

# @param {Character[][]} board
# @return {Void} Do not return anything, modify board in-place instead.
def solve(board)
    @rows = board.length
    @cols = board[0].length
    @board = board
    (0...@rows).each do |r|
        (0...@cols).each do |c|
            # if its an 'O' and its on the border
            if @board[r][c] == 'O' && [0, @rows - 1].include?(r) || [0, @cols - 1].include?(c)
                capture(r, c)
            end
        end
    end
    (0...@rows).each do |r|
        (0...@cols).each do |c|
            @board[r][c] = 'X' if @board[r][c] == 'O'
        end
    end

    (0...@rows).each do |r|
        (0...@cols).each do |c|
            @board[r][c] = 'O' if @board[r][c] == 'T'
        end
    end
end

def capture(r, c)
    if r < 0 || r >= @rows || c < 0 || c >= @cols || @board[r][c] != 'O'
        return
    end

    @board[r][c] = 'T'
    capture(r + 1, c)
    capture(r - 1, c)
    capture(r, c + 1)
    capture(r, c - 1)
end
