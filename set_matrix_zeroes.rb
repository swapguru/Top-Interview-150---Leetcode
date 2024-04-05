=begin
Given an m x n integer matrix matrix, if an element is 0, set its entire row and column to 0's.

You must do it in place.

Example 1:

Input: matrix = [[1,1,1],[1,0,1],[1,1,1]]
Output: [[1,0,1],[0,0,0],[1,0,1]]
Example 2:

Input: matrix = [[0,1,2,0],[3,4,5,2],[1,3,1,5]]
Output: [[0,0,0,0],[0,4,5,0],[0,3,1,0]]

Constraints:

m == matrix.length
n == matrix[0].length
1 <= m, n <= 200
-231 <= matrix[i][j] <= 231 - 1

=end

# @param {Integer[][]} matrix
# @return {Void} Do not return anything, modify matrix in-place instead.
def set_zeroes(matrix)
  zero_column_indices = []
  zero_row_indices = []
  for index_i in 0..(matrix.length - 1) do
      for index_j in 0..(matrix.first.length - 1) do
          if matrix[index_i][index_j].zero?
              zero_column_indices << index_j
              zero_row_indices << index_i
          end
      end
  end

  for m in 0..(matrix.length - 1) do
      zero_column_indices.each { |index_j| matrix[m][index_j] = 0 }
      zero_row_indices.each { |index_i| matrix[index_i][m] = 0 }
  end
end
