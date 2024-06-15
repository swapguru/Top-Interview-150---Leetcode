=begin
Given the root of a Binary Search Tree (BST), return the minimum absolute difference between the values of any two different nodes in the tree.

Example 1:

Input: root = [4,2,6,1,3]
Output: 1

Example 2:

Input: root = [1,0,48,null,null,12,49]
Output: 1

Constraints:

The number of nodes in the tree is in the range [2, 104].
0 <= Node.val <= 105

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
# @return {Integer}
def get_minimum_difference(root)
  result = Float::INFINITY
  prev_node = nil
  dfs = ->(node) {
    dfs.call(node.left) if node.left
    if prev_node
      result = [node.val - prev_node.val, result].min
    end
    prev_node = node
    dfs.call(node.right) if node.right
  }
  dfs.call(root)
  result
end
