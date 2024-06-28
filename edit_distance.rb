=begin
Given two strings word1 and word2, return the minimum number of operations required to convert word1 to word2.

You have the following three operations permitted on a word:

Insert a character
Delete a character
Replace a character

Example 1:

Input: word1 = "horse", word2 = "ros"
Output: 3
Explanation:
horse -> rorse (replace 'h' with 'r')
rorse -> rose (remove 'r')
rose -> ros (remove 'e')

Example 2:

Input: word1 = "intention", word2 = "execution"
Output: 5
Explanation:
intention -> inention (remove 't')
inention -> enention (replace 'i' with 'e')
enention -> exention (replace 'n' with 'x')
exention -> exection (replace 'n' with 'c')
exection -> execution (insert 'u')

Constraints:

0 <= word1.length, word2.length <= 500
word1 and word2 consist of lowercase English letters.

=end

# @param {String} word1
# @param {String} word2
# @return {Integer}
def min_distance(word1, word2)
  n1 = word1.length
  n2 = word2.length

  dp = Array.new(n1 + 1) { Array.new(n2 + 1, Float::INFINITY) }

  n2.downto(0) { |j| dp[n1][j] = n2 - j }
  n1.downto(0) { |i| dp[i][n2] = n1 - i }

  (n1 - 1).downto(0).each do |i|
    (n2 - 1).downto(0).each do |j|
      if word1[i] == word2[j]
        dp[i][j] = dp[i + 1][j + 1]
      else
        dp[i][j] = 1 + [
          dp[i][j + 1],
          dp[i + 1][j],
          dp[i + 1][j + 1]
        ].min
      end
    end
  end
  dp[0][0]
end
