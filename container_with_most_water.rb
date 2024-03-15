=begin
You are given an integer array height of length n. There are n vertical lines drawn such that the two endpoints of the ith line are (i, 0) and (i, height[i]).

Find two lines that together with the x-axis form a container, such that the container contains the most water.

Return the maximum amount of water a container can store.

Notice that you may not slant the container.

Example 1:

Input: height = [1,8,6,2,5,4,8,3,7]
Output: 49
Explanation: The above vertical lines are represented by array [1,8,6,2,5,4,8,3,7]. In this case, the max area of water (blue section) the container can contain is 49.
Example 2:

Input: height = [1,1]
Output: 1

Constraints:

n == height.length
2 <= n <= 105
0 <= height[i] <= 104
=end

# @param {Integer[]} height
# @return {Integer}
def max_area(height)
  start_index = 0
  end_index = height.size - 1
  max_area = 0

  while start_index != end_index do
    if height[start_index] > height[end_index]
      area = height[end_index] * (end_index - start_index)
      max_area = area if max_area < area
      end_index -= 1
    else
      area = height[start_index] * (end_index - start_index)
      max_area = area if max_area < area
      start_index += 1
    end
  end
  max_area
end
