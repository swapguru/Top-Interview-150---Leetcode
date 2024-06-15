=begin
Given an m x n 2D binary grid grid which represents a map of '1's (land) and '0's (water), return the number of islands.

An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.

Example 1:

Input: grid = [
  ["1","1","1","1","0"],
  ["1","1","0","1","0"],
  ["1","1","0","0","0"],
  ["0","0","0","0","0"]
]
Output: 1

Example 2:

Input: grid = [
  ["1","1","0","0","0"],
  ["1","1","0","0","0"],
  ["0","0","1","0","0"],
  ["0","0","0","1","1"]
]
Output: 3

Constraints:

m == grid.length
n == grid[i].length
1 <= m, n <= 300
grid[i][j] is '0' or '1'.
=end

# @param {Character[][]} grid
# @return {Integer}
def dfs(grid, i, j)
  n = grid.length
  m = grid[0].length

  if i < 0 || j < 0 || i >= n || j >= m || grid[i][j] != '1'
    return
  end

  grid[i][j] = '2' # Mark as visited

  # Explore neighbors
  dfs(grid, i+1, j) # Check bottom
  dfs(grid, i-1, j) # Check top
  dfs(grid, i, j+1) # Check right
  dfs(grid, i, j-1) # Check left
end

def num_islands(grid)
  count = 0
  n = grid.length
  m = grid[0].length

  for i in 0...n
    for j in 0...m
      if grid[i][j] == '1'
        count += 1
        dfs(grid, i, j)
      end
    end
  end
  return count
end
