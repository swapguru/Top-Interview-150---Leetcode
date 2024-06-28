=begin
Given a m x n grid filled with non-negative numbers, find a path from top left to bottom right, which minimizes the sum of all numbers along its path.

Note: You can only move either down or right at any point in time.

Example 1:

Input: grid = [[1,3,1],[1,5,1],[4,2,1]]
Output: 7
Explanation: Because the path 1 → 3 → 1 → 1 → 1 minimizes the sum.

Example 2:

Input: grid = [[1,2,3],[4,5,6]]
Output: 12

Constraints:

m == grid.length
n == grid[i].length
1 <= m, n <= 200
0 <= grid[i][j] <= 200

=end

# @param {Integer[][]} grid
# @return {Integer}
def min_path_sum(grid)
  m = grid.length
  n = grid[0].length
  dp = Array.new(m + 1) { Array.new(n + 1, Float::INFINITY) }
  dp[m - 1][-1] = 0
  (m - 1).downto(0) do |r|
    (n - 1).downto(0) do |c|
      dp[r][c] = grid[r][c] + [dp[r][c + 1], dp[r + 1][c]].min
    end
  end
  dp[0][0]
end
