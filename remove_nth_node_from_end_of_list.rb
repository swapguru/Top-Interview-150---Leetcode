=begin
Given the head of a linked list, remove the nth node from the end of the list and return its head.

Example 1:

Input: head = [1,2,3,4,5], n = 2
Output: [1,2,3,5]

Example 2:

Input: head = [1], n = 1
Output: []

Example 3:

Input: head = [1,2], n = 1
Output: [1]

Constraints:

The number of nodes in the list is sz.
1 <= sz <= 30
0 <= Node.val <= 100
1 <= n <= sz

Follow up: Could you do this in one pass?

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
# @param {Integer} n
# @return {ListNode}
def remove_nth_from_end(head, n)
  return nil if head == nil or head.next == nil

  dummy = ListNode.new(0)
  dummy.next = head
  count = 0

  iterate = head
  while iterate != nil
    count+=1
    iterate = iterate.next
  end
  count-=n
  prev = dummy
  for a in 1..count do
    prev = prev.next
  end

  prev.next = prev.next.next
  return dummy.next
end
