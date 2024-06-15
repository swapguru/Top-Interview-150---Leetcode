=begin
You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order, and each of their nodes contains a single digit. Add the two numbers and return the sum as a linked list.

You may assume the two numbers do not contain any leading zero, except the number 0 itself.

Example 1:

Input: l1 = [2,4,3], l2 = [5,6,4]
Output: [7,0,8]
Explanation: 342 + 465 = 807.

Example 2:

Input: l1 = [0], l2 = [0]
Output: [0]

Example 3:

Input: l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]
Output: [8,9,9,9,0,0,0,1]

Constraints:

The number of nodes in each linked list is in the range [1, 100].
0 <= Node.val <= 9
It is guaranteed that the list represents a number that does not have leading zeros.

=end

# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def add_two_numbers(l1, l2)
  l1_current = l1
  l2_current = l2
  add_one = false
  current = nil

  while l1_current || l2_current || add_one
    l1_digit = l1_current ? l1_current.val : 0
    l2_digit = l2_current ? l2_current.val : 0

    l1_current = l1_current.next if l1_current
    l2_current = l2_current.next if l2_current

    sum = l1_digit + l2_digit
    sum += 1 if add_one
    add_one = false

    if sum > 9
      val = sum.to_s[-1].to_i
      add_one = true
    else
      val = sum
    end

    if current
      current.next = ListNode.new(val)
      current = current.next
    else
      answer = ListNode.new(val)
      current = answer
    end
  end
  answer
end
