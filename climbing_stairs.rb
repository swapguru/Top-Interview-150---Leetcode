=begin
You are climbing a staircase. It takes n steps to reach the top.

Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?

Example 1:

Input: n = 2
Output: 2
Explanation: There are two ways to climb to the top.
1. 1 step + 1 step
2. 2 steps

Example 2:

Input: n = 3
Output: 3
Explanation: There are three ways to climb to the top.
1. 1 step + 1 step + 1 step
2. 1 step + 2 steps
3. 2 steps + 1 step

Constraints:

1 <= n <= 45

=end

# @param {Integer} n
# @return {Integer}
def climb_stairs(n)
  ways = 1
  w1, w2 = 0,0
  (1..n).each do |i|
    w1, w2 = w1 + ways, w2 + ways
    ways, w1 = w1, w2
    w2 = 0
  end
  ways
end
