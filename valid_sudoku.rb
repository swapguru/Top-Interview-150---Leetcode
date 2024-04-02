=begin
Determine if a 9 x 9 Sudoku board is valid. Only the filled cells need to be validated according to the following rules:

Each row must contain the digits 1-9 without repetition.
Each column must contain the digits 1-9 without repetition.
Each of the nine 3 x 3 sub-boxes of the grid must contain the digits 1-9 without repetition.
Note:

A Sudoku board (partially filled) could be valid but is not necessarily solvable.
Only the filled cells need to be validated according to the mentioned rules.

Example 1:

Input: board =
[["5","3",".",".","7",".",".",".","."]
,["6",".",".","1","9","5",".",".","."]
,[".","9","8",".",".",".",".","6","."]
,["8",".",".",".","6",".",".",".","3"]
,["4",".",".","8",".","3",".",".","1"]
,["7",".",".",".","2",".",".",".","6"]
,[".","6",".",".",".",".","2","8","."]
,[".",".",".","4","1","9",".",".","5"]
,[".",".",".",".","8",".",".","7","9"]]
Output: true

Example 2:

Input: board =
[["8","3",".",".","7",".",".",".","."]
,["6",".",".","1","9","5",".",".","."]
,[".","9","8",".",".",".",".","6","."]
,["8",".",".",".","6",".",".",".","3"]
,["4",".",".","8",".","3",".",".","1"]
,["7",".",".",".","2",".",".",".","6"]
,[".","6",".",".",".",".","2","8","."]
,[".",".",".","4","1","9",".",".","5"]
,[".",".",".",".","8",".",".","7","9"]]
Output: false

Explanation: Same as Example 1, except with the 5 in the top left corner being modified to 8. Since there are two 8's in the top left 3x3 sub-box, it is invalid.


Constraints:

board.length == 9
board[i].length == 9
board[i][j] is a digit 1-9 or '.'.

=end

# @param {Character[][]} board
# @return {Boolean}
def is_valid_sudoku(board)
  board.each do |row|
    return false unless valid?(row)
  end
  (0...board[0].length).each do |i|
    return false unless valid? board.map{|row| row[i]}
  end
  [0,3,6].each do |row_init|
    [0,3,6].each do |col_init|
      sub_box =
      [0,1,2].map do |row_step|
        [0,1,2].map {|col_step| board[row_init + row_step][col_init + col_step]}
      end.flatten
      return false unless valid? sub_box
    end
  end
  true
end

def valid?(array)
  array.reject{|n| [".", ","].
    include?(n)}.each_with_object(Hash.new(0)){|n, hash| hash[n] += 1 }.
    all?{|k, v| v <= 1}
end
