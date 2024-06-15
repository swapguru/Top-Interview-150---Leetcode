=begin
Given the root of a binary tree, check whether it is a mirror of itself (i.e., symmetric around its center).

Example 1:

Input: root = [1,2,2,3,4,4,3]
Output: true

Example 2:

Input: root = [1,2,2,null,3,null,3]
Output: false

Constraints:

The number of nodes in the tree is in the range [1, 1000].
-100 <= Node.val <= 100

Follow up: Could you solve it both recursively and iteratively?
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
# @return {Boolean}
def is_symmetric(root)
  visit = -> (node_a, node_b) {
    return true  if !node_a && !node_b       # true if neither node exists
    return false if !!node_a != !!node_b     # false if one one node exists
    return false if node_a.val != node_b.val # false if the values don't match

    visit.call(node_a.left, node_b.right) && visit.call(node_a.right, node_b.left)
  }
  visit.call(root.left, root.right)
end
