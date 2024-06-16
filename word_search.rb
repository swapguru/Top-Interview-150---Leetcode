=begin
Given an m x n grid of characters board and a string word, return true if word exists in the grid.

The word can be constructed from letters of sequentially adjacent cells, where adjacent cells are horizontally or vertically neighboring. The same letter cell may not be used more than once.

Example 1:

Input: board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "ABCCED"
Output: true

Example 2:

Input: board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "SEE"
Output: true

Example 3:

Input: board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "ABCB"
Output: false

Constraints:

m == board.length
n = board[i].length
1 <= m, n <= 6
1 <= word.length <= 15
board and word consists of only lowercase and uppercase English letters.

=end

# @param {Character[][]} board
# @param {String} word
# @return {Boolean}
require 'set'
def exist(board, word)
    if word.match(/^#{word[0]}+/)[0].size > word.match(/#{word[-1]}+$/)[0].size
      word.reverse!
    end

    @visited = Set.new
    @board = board
    @word = word
    @rows = board.length
    @cols = board[0].length

    (0...@rows).each do |r|
      (0...@cols).each do |c|
        return true if dfs(r, c, 0)
      end
    end
    false
end

def dfs(r, c, i)
    return true if i == @word.length

    return false if r < 0 || r >= @rows || c < 0 || c >= @cols || @board[r][c] != @word[i] || @visited.include?([r, c])

    @visited << [r, c]

    result = dfs(r + 1, c, i + 1) || dfs(r - 1, c, i + 1) || dfs(r, c + 1, i + 1) || dfs(r, c - 1, i + 1)

    @visited.delete([r, c])

    result
end
