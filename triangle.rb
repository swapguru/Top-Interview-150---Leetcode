=begin
Given a triangle array, return the minimum path sum from top to bottom.

For each step, you may move to an adjacent number of the row below. More formally, if you are on index i on the current row, you may move to either index i or index i + 1 on the next row.

Example 1:

Input: triangle = [[2],[3,4],[6,5,7],[4,1,8,3]]
Output: 11
Explanation: The triangle looks like:
2
3 4
6 5 7
4 1 8 3
The minimum path sum from top to bottom is 2 + 3 + 5 + 1 = 11 (underlined above).

Example 2:

Input: triangle = [[-10]]
Output: -10

Constraints:

1 <= triangle.length <= 200
triangle[0].length == 1
triangle[i].length == triangle[i - 1].length + 1
-104 <= triangle[i][j] <= 104

Follow up: Could you do this using only O(n) extra space, where n is the total number of rows in the triangle?

=end

# @param {Integer[][]} triangle
# @return {Integer}

def minimum_total(triangle)
  dp = Array.new(triangle.size + 1) { 0 }
  row_num = triangle.size - 1
  while row_num > -1
    i = 0
    while i < triangle[row_num].size
      dp[i] = triangle[row_num][i] + [dp[i], dp[i + 1]].min
      i+= 1
    end
    row_num -= 1
  end
  dp[0]
end
