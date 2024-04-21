=begin

Given an unsorted array of integers nums, return the length of the longest consecutive elements sequence.

You must write an algorithm that runs in O(n) time.

Example 1:

Input: nums = [100,4,200,1,3,2]
Output: 4
Explanation: The longest consecutive elements sequence is [1, 2, 3, 4]. Therefore its length is 4.
Example 2:

Input: nums = [0,3,7,2,5,8,4,6,0,1]
Output: 9

Constraints:

0 <= nums.length <= 105
-109 <= nums[i] <= 109

=end

# @param {Integer[]} nums
# @return {Integer}
def longest_consecutive(nums)
  nums = nums.sort.uniq
  count = 0
  max_count = 0
  nums.each_with_index do |num, i|
      if nums[i+1] && nums[i+1] - num == 1
          count += 1
          next
      end

      max_count = [count + 1, max_count].max
      count = 0
  end
  max_count
end
