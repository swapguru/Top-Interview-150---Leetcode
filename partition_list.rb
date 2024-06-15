=begin
Given the head of a linked list and a value x, partition it such that all nodes less than x come before nodes greater than or equal to x.

You should preserve the original relative order of the nodes in each of the two partitions.

Example 1:

Input: head = [1,4,3,2,5,2], x = 3
Output: [1,2,2,4,3,5]

Example 2:

Input: head = [2,1], x = 2
Output: [1,2]

Constraints:

The number of nodes in the list is in the range [0, 200].
-100 <= Node.val <= 100
-200 <= x <= 200

=end

# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @param {Integer} x
# @return {ListNode}
def partition(head, x)
  result1 = ListNode.new
  result2 = ListNode.new
  result_curr1 = result1
  result_curr2 = result2
  curr = head
  while !curr.nil?
    new_node = ListNode.new(curr.val)
    if curr.val < x
      result_curr1.next = new_node
      result_curr1 = result_curr1.next
    else
      result_curr2.next = new_node
      result_curr2 = result_curr2.next
    end
    curr = curr.next
  end

  result_curr1.next = result2.next
  result1.next
end
