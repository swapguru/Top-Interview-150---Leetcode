=begin
Given a string s, return the longest palindromic substring in s.

Example 1:

Input: s = "babad"
Output: "bab"
Explanation: "aba" is also a valid answer.

Example 2:

Input: s = "cbbd"
Output: "bb"

Constraints:

1 <= s.length <= 1000
s consist of only digits and English letters.

=end
# @param {String} s
# @return {String}
def longest_palindrome(s)
  longest_str = ''

  s.chars.each_with_index do |_char, i|
    str1 = palindrome_length(s, i, i)
    str2 = palindrome_length(s, i, i + 1)
    curr_str = [str1, str2].max_by(&:length)
    longest_str = curr_str if curr_str.length > longest_str.length
  end
  longest_str
end

def palindrome_length(str, left, right)
  while left >= 0 && right < str.length && str[left] == str[right]
    left -= 1
    right += 1
  end
  str[(left + 1)..(right - 1)]
end
