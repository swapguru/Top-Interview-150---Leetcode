=begin
Given an integer array nums, return the length of the longest strictly increasing subsequence.

Example 1:

Input: nums = [10,9,2,5,3,7,101,18]
Output: 4
Explanation: The longest increasing subsequence is [2,3,7,101], therefore the length is 4.

Example 2:

Input: nums = [0,1,0,3,2,3]
Output: 4

Example 3:

Input: nums = [7,7,7,7,7,7,7]
Output: 1

Constraints:

1 <= nums.length <= 2500
-104 <= nums[i] <= 104

Follow up: Can you come up with an algorithm that runs in O(n log(n)) time complexity?

=end

# @param {Integer[]} nums
# @return {Integer}
def length_of_lis(nums)
  memo = Array.new(nums.size, 1)
  nums.each_with_index do |n, i|
    (0...i).each do |j|
      memo[i] = [memo[i], memo[j] + 1].max if n > nums[j]
    end
  end
  memo.max
end
