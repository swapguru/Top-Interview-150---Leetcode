=begin
Given an m x n binary matrix filled with 0's and 1's, find the largest square containing only 1's and return its area.

Example 1:

Input: matrix = [["1","0","1","0","0"],["1","0","1","1","1"],["1","1","1","1","1"],["1","0","0","1","0"]]
Output: 4

Example 2:

Input: matrix = [["0","1"],["1","0"]]
Output: 1

Example 3:

Input: matrix = [["0"]]
Output: 0

Constraints:

m == matrix.length
n == matrix[i].length
1 <= m, n <= 300
matrix[i][j] is '0' or '1'.

=end

# @param {Character[][]} matrix
# @return {Integer}
def maximal_square(matrix)
  rows = matrix.length
  cols = matrix[0].length
  dp = Array.new(rows + 1, 0) { Array.new(cols + 1, 0)}
  max_length = 0

  (rows - 1).downto(0).each do |i|
    (cols - 1).downto(0).each do |j|
      if matrix[i][j] == '1'
        dp[i][j] = 1 + [dp[i + 1][j], dp[i][j + 1], dp[i + 1][j + 1]].min
        max_length = [max_length, dp[i][j]].max
      end
    end
  end
  max_length ** 2
end
