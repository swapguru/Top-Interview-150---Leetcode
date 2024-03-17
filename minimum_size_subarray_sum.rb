=begin
Given an array of positive integers nums and a positive integer target, return the minimal length of a
subarray
Subarray
A subarray is a contiguous non-empty sequence of elements within an array whose sum is greater than or equal to target. If there is no such subarray, return 0 instead.

Example 1:

Input: target = 7, nums = [2,3,1,2,4,3]
Output: 2
Explanation: The subarray [4,3] has the minimal length under the problem constraint.
Example 2:

Input: target = 4, nums = [1,4,4]
Output: 1
Example 3:

Input: target = 11, nums = [1,1,1,1,1,1,1,1]
Output: 0

Constraints:

1 <= target <= 109
1 <= nums.length <= 105
1 <= nums[i] <= 104

Follow up: If you have figured out the O(n) solution, try coding another solution of which the time complexity is O(n log(n)).
=end

def min_sub_array_len(target, nums)
  result = 0
  number = 0
  i = 0

  nums.each_with_index do |n, index|
    number += n
    next if number < target

    while number >= target do
      val = index - i + 1
      result = val if val < result || result == 0
      number -= nums[i]
      i += 1
    end
  end
  result
end
