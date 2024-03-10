=begin
Given n non-negative integers representing an elevation map where the width of each bar is 1, compute how much water it can trap after raining.

Example 1:

Input: height = [0,1,0,2,1,0,1,3,2,1,2,1]
Output: 6
Explanation: The above elevation map (black section) is represented by array [0,1,0,2,1,0,1,3,2,1,2,1]. In this case, 6 units of rain water (blue section) are being trapped.
Example 2:

Input: height = [4,2,0,3,2,5]
Output: 9

Constraints:

n == height.length
1 <= n <= 2 * 104
0 <= height[i] <= 105
=end

# @param {Integer[]} height
# @return {Integer}
def trap(height)
  n = height.length
  water = 0
  for index in 1..(height.length - 2) do
      left_max = height[0..index - 1].max
      right_max =  height[index + 1..n].max
      trapped_water = ([left_max, right_max].min) - height[index]
      water += trapped_water if trapped_water.positive?
  end
  water
end
