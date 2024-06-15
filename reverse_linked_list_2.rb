=begin
Given the head of a singly linked list and two integers left and right where left <= right, reverse the nodes of the list from position left to position right, and return the reversed list.

Example 1:

Input: head = [1,2,3,4,5], left = 2, right = 4
Output: [1,4,3,2,5]

Example 2:

Input: head = [5], left = 1, right = 1
Output: [5]

Constraints:

The number of nodes in the list is n.
1 <= n <= 500
-500 <= Node.val <= 500
1 <= left <= right <= n

Follow up: Could you do it in one pass?

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
# @param {Integer} left
# @param {Integer} right
# @return {ListNode}
def reverse_between(head, left, right)
  return head if left == right
  dummy = ListNode.new(0, @next=head)
  prev = dummy
  i = 1

  # Set prev to pointer before left
  while i < left
    prev = prev.next
    i += 1
  end

  curr = prev.next
  next_node = curr.next

  # Begin reverse process with node at left and its next node
  while i < right
    temp = next_node.next
    next_node.next = curr
    curr = next_node

    next_node = temp
    i += 1
  end

  # Set prev (1) next pointers to the in-between reversed list end i.e example1 = 4 -> 3 -> 2 AND
  # remaining part of the linked list i.e 5 -> nil
  prev.next.next = next_node
  prev.next = curr

  dummy.next
end
