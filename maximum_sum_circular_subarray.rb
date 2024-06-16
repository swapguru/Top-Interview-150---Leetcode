=begin
Given a circular integer array nums of length n, return the maximum possible sum of a non-empty subarray of nums.

A circular array means the end of the array connects to the beginning of the array. Formally, the next element of nums[i] is nums[(i + 1) % n] and the previous element of nums[i] is nums[(i - 1 + n) % n].

A subarray may only include each element of the fixed buffer nums at most once. Formally, for a subarray nums[i], nums[i + 1], ..., nums[j], there does not exist i <= k1, k2 <= j with k1 % n == k2 % n.

Example 1:

Input: nums = [1,-2,3,-2]
Output: 3
Explanation: Subarray [3] has maximum sum 3.

Example 2:

Input: nums = [5,-3,5]
Output: 10
Explanation: Subarray [5,5] has maximum sum 5 + 5 = 10.

Example 3:

Input: nums = [-3,-2,-3]
Output: -2
Explanation: Subarray [-2] has maximum sum -2.

Constraints:

n == nums.length
1 <= n <= 3 * 104
-3 * 104 <= nums[i] <= 3 * 104

=end

# @param {Integer[]} nums
# @return {Integer}
def max_subarray_sum_circular(nums)
  max_sum = nums[0]
  min_sum = nums[0]
  curr_max = nums[0]
  curr_min = nums[0]
  total_sum = nums[0]
  (1...nums.length).each do |i|
    num = nums[i]

    curr_max = [num, (curr_max + num)].max
    max_sum = [max_sum, curr_max].max

    curr_min = [num, (curr_min + num)].min
    min_sum = [min_sum, curr_min].min

    total_sum += num
  end
  max_sum < 0 ? max_sum : [max_sum, total_sum - min_sum].max
end
