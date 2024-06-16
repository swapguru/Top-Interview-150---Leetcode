=begin
The n-queens puzzle is the problem of placing n queens on an n x n chessboard such that no two queens attack each other.

Given an integer n, return the number of distinct solutions to the n-queens puzzle.

Example 1:

Input: n = 4
Output: 2
Explanation: There are two distinct solutions to the 4-queens puzzle as shown.

Example 2:

Input: n = 1
Output: 1

Constraints:

1 <= n <= 9

=end

# @param {Integer} n
# @return {Integer}
def total_n_queens(n)
  @count = 0
  queen_helper(n, 0, [])
  @count
end

def queen_helper(n, i, slate)
  return if slate.size > 0  and !correct_solution(slate, i)

  if i == n
    @count += 1
    return
  end

  for j in (0...n) do
    slate << j
    queen_helper(n, i+1, slate)
    slate.pop
  end
end

def correct_solution(arr, i)
  last_val = arr[i-1]
  last_index = i-1

  return false if arr[0...last_index].include?(last_val)
  for j in (0...last_index) do
    return false if (last_index-j).abs == (last_val-arr[j]).abs
  end

  return true
end
