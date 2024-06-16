=begin
Given an array nums of distinct integers, return all the possible permutations. You can return the answer in any order.

Example 1:

Input: nums = [1,2,3]
Output: [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]

Example 2:

Input: nums = [0,1]
Output: [[0,1],[1,0]]

Example 3:

Input: nums = [1]
Output: [[1]]

Constraints:

1 <= nums.length <= 6
-10 <= nums[i] <= 10
All the integers of nums are unique.

=end

# @param {Integer[]} nums
# @return {Integer[][]}
def permute(nums)
  @result = []
  permute_helper(nums, [])
  return @result
end

def permute_helper(nums, current)
  if(nums.empty?)
      @result.push(current.dup())
      return
  end

  j = 0
  while(j < nums.size)
      current.push(nums[j])
      next_nums = nums.dup()
      next_nums.delete_at(j)
      permute_helper(next_nums, current)
      current.pop()
      j += 1
  end
end
