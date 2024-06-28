=begin
You are given an m x n integer array grid. There is a robot initially located at the top-left corner (i.e., grid[0][0]). The robot tries to move to the bottom-right corner (i.e., grid[m - 1][n - 1]). The robot can only move either down or right at any point in time.

An obstacle and space are marked as 1 or 0 respectively in grid. A path that the robot takes cannot include any square that is an obstacle.

Return the number of possible unique paths that the robot can take to reach the bottom-right corner.

The testcases are generated so that the answer will be less than or equal to 2 * 109.

Example 1:

Input: obstacleGrid = [[0,0,0],[0,1,0],[0,0,0]]
Output: 2
Explanation: There is one obstacle in the middle of the 3x3 grid above.
There are two ways to reach the bottom-right corner:
1. Right -> Right -> Down -> Down
2. Down -> Down -> Right -> Right

Example 2:

Input: obstacleGrid = [[0,1],[0,0]]
Output: 1

Constraints:

m == obstacleGrid.length
n == obstacleGrid[i].length
1 <= m, n <= 100
obstacleGrid[i][j] is 0 or 1.

=end

# @param {Integer[][]} obstacle_grid
# @return {Integer}
def unique_paths_with_obstacles(obstacle_grid)
  m = obstacle_grid.length
  n = obstacle_grid[0].length
  dp = [0] * n
  dp[n - 1] = 1
  (m - 1).downto(0) do |i|
    (n - 1).downto(0) do |j|
      if obstacle_grid[i][j] == 1
        dp[j] = 0
      elsif j + 1 < n
        dp[j] = dp[j] + dp[j + 1]
      end
    end
  end
  dp[0]
end
