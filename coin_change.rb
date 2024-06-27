=begin
You are given an integer array coins representing coins of different denominations and an integer amount representing a total amount of money.

Return the fewest number of coins that you need to make up that amount. If that amount of money cannot be made up by any combination of the coins, return -1.

You may assume that you have an infinite number of each kind of coin.

Example 1:

Input: coins = [1,2,5], amount = 11
Output: 3
Explanation: 11 = 5 + 5 + 1

Example 2:

Input: coins = [2], amount = 3
Output: -1

Example 3:

Input: coins = [1], amount = 0
Output: 0

Constraints:

1 <= coins.length <= 12
1 <= coins[i] <= 231 - 1
0 <= amount <= 104

=end

# @param {Integer[]} coins
# @param {Integer} amount
# @return {Integer}
def coin_change(coins, amount)
  dp = Array.new(amount + 1, amount + 1)
  dp[0] = 0

  (1..amount).each do |a|
    coins.each do |c|
      dp[a] = [dp[a], 1 + dp[a - c]].min if a - c >= 0
    end
  end
  dp[amount] != amount + 1 ? dp[amount] : -1
end
