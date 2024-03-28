=begin

Given two strings s and t of lengths m and n respectively, return the minimum window
substring of s such that every character in t (including duplicates) is included in the window. If there is no such substring, return the empty string "".

The testcases will be generated such that the answer is unique.

Example 1:

Input: s = "ADOBECODEBANC", t = "ABC"
Output: "BANC"
Explanation: The minimum window substring "BANC" includes 'A', 'B', and 'C' from string t.
Example 2:

Input: s = "a", t = "a"
Output: "a"
Explanation: The entire string s is the minimum window.
Example 3:

Input: s = "a", t = "aa"
Output: ""
Explanation: Both 'a's from t must be included in the window.
Since the largest window of s only has one 'a', return empty string.

Constraints:

m == s.length
n == t.length
1 <= m, n <= 105
s and t consist of uppercase and lowercase English letters.

Follow up: Could you find an algorithm that runs in O(m + n) time?

=end

# @param {String} s
# @param {String} t
# @return {String}
require 'set'

def min_window(s, t)
    m = s.length
    n = t.length
    t_freq = Hash.new(0)
    t.each_char { |char| t_freq[char] += 1 }
    st = []
    (0...m).each do |i|
        st << i if t_freq.include?(s[i])
    end
    result = ""
    count = 0
    freq = Hash.new(0)
    min_len = Float::INFINITY
    left = 0
    st.each_with_index do |right, index|
        c = s[right]
        freq[c] += 1
        count += 1 if freq[c] <= t_freq[c]
        if count == n
            c = s[st[left]]
            while freq[c] > t_freq[c]
                freq[c] -= 1
                left += 1
                c = s[st[left]]
            end
            if right - st[left] + 1 < min_len
                min_len = right - st[left] + 1
                result = s[st[left]..right]
            end
        end
    end
    result
end
