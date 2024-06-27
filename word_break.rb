=begin
Given a string s and a dictionary of strings wordDict, return true if s can be segmented into a space-separated sequence of one or more dictionary words.

Note that the same word in the dictionary may be reused multiple times in the segmentation.

Example 1:

Input: s = "leetcode", wordDict = ["leet","code"]
Output: true
Explanation: Return true because "leetcode" can be segmented as "leet code".

Example 2:

Input: s = "applepenapple", wordDict = ["apple","pen"]
Output: true
Explanation: Return true because "applepenapple" can be segmented as "apple pen apple".
Note that you are allowed to reuse a dictionary word.

Example 3:

Input: s = "catsandog", wordDict = ["cats","dog","sand","and","cat"]
Output: false

Constraints:

1 <= s.length <= 300
1 <= wordDict.length <= 1000
1 <= wordDict[i].length <= 20
s and wordDict[i] consist of only lowercase English letters.
All the strings of wordDict are unique.

=end

# @param {String} s
# @param {String[]} word_dict
# @return {Boolean}
def word_break(s, word_dict)
  @l = s.size
  @s = s
  @dp = Array.new(@l)
  @dict = word_dict.map{|x| [x.size,Regexp.new(?^+x)]}
  rec(0)
end

def rec(i)
  return true if i == @l
  return @dp[i] if ! @dp[i].nil?
  ans = false
  str = @s[i..-1]
  @dict.each do |(len,regex)|
    ans = true if rec(i+len)  if regex === str
  end
  @dp[i] = ans
  ans
end
