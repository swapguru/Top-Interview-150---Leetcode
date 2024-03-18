=begin
Given a string s, find the length of the longest substring without repeating characters.

Example 1:

Input: s = "abcabcbb"
Output: 3
Explanation: The answer is "abc", with the length of 3.
Example 2:

Input: s = "bbbbb"
Output: 1
Explanation: The answer is "b", with the length of 1.
Example 3:

Input: s = "pwwkew"
Output: 3
Explanation: The answer is "wke", with the length of 3.
Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.

Constraints:

0 <= s.length <= 5 * 104
s consists of English letters, digits, symbols and spaces.
=end

# @param {String} s
# @return {Integer}
def length_of_longest_substring(str)
  return 0 unless str.length > 0
  sub_strs = []
  sub_str = []
  str.each_char do |c|
    if sub_str.include?(c)
      i = sub_str.index(c)
      sub_strs << sub_str
      sub_str = sub_str.slice(i+1..)
    end
    sub_str << c
  end
  sub_strs << sub_str
  sub_strs.map(&:length).max
end
