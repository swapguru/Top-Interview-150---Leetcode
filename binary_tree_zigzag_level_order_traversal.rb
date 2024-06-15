=begin
Given the root of a binary tree, return the zigzag level order traversal of its nodes' values. (i.e., from left to right, then right to left for the next level and alternate between).

Example 1:

Input: root = [3,9,20,null,null,15,7]
Output: [[3],[20,9],[15,7]]

Example 2:

Input: root = [1]
Output: [[1]]

Example 3:

Input: root = []
Output: []

Constraints:

The number of nodes in the tree is in the range [0, 2000].
-100 <= Node.val <= 100

=end

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root
# @return {Integer[][]}
def zigzag_level_order(root)
  queue = []
  queue << root
  result = []
  while !queue.empty?
    level = []
    queue.size.times do
      curr = queue.shift

      next if curr.nil?

      level << curr.val

      queue << curr.left if !curr.left.nil?
      queue << curr.right if !curr.right.nil?
    end
    result << level if !level.empty?
  end

  result.each_with_index do |arr, i|
    result[i] = arr.reverse! if i.odd?
  end
  result
end
