=begin
Given an array of integers nums sorted in non-decreasing order, find the starting and ending position of a given target value.

If target is not found in the array, return [-1, -1].

You must write an algorithm with O(log n) runtime complexity.

Example 1:

Input: nums = [5,7,7,8,8,10], target = 8
Output: [3,4]

Example 2:

Input: nums = [5,7,7,8,8,10], target = 6
Output: [-1,-1]

Example 3:

Input: nums = [], target = 0
Output: [-1,-1]

Constraints:

0 <= nums.length <= 105
-109 <= nums[i] <= 109
nums is a non-decreasing array.
-109 <= target <= 109

=end

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}

def search_range(nums, target)
  a = bsearch(nums, target)
  b = bsearch(nums, target+1)
  nums[a] != target ? [-1,-1] : [a, nums[b] == target ? b : b-1]
end

def bsearch(nums, target)
  l, r = 0, nums.size - 1
  while l < r
    m = (l+r)/2
    nums[m] < target ? l = m + 1 : r = m
  end
  return l
end
