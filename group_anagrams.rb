=begin
Given an array of strings strs, group the anagrams together. You can return the answer in any order.

An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.

Example 1:

Input: strs = ["eat","tea","tan","ate","nat","bat"]
Output: [["bat"],["nat","tan"],["ate","eat","tea"]]
Example 2:

Input: strs = [""]
Output: [[""]]
Example 3:

Input: strs = ["a"]
Output: [["a"]]

Constraints:

1 <= strs.length <= 104
0 <= strs[i].length <= 100
strs[i] consists of lowercase English letters.
=end

# @param {String[]} strs
# @return {String[][]}
def group_anagrams(strs)
  return [strs] if strs.length == 1 || strs.length == 0

  hash = Hash.new { |h,k| h[k] = [] }
  strs.each do |str|
    sorted_str = str.chars.sort.join
    hash[sorted_str] << str
  end
  hash.values
end
