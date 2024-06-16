=begin
Given a string containing digits from 2-9 inclusive, return all possible letter combinations that the number could represent. Return the answer in any order.

A mapping of digits to letters (just like on the telephone buttons) is given below. Note that 1 does not map to any letters.

Example 1:

Input: digits = "23"
Output: ["ad","ae","af","bd","be","bf","cd","ce","cf"]

Example 2:

Input: digits = ""
Output: []

Example 3:

Input: digits = "2"
Output: ["a","b","c"]

Constraints:

0 <= digits.length <= 4
digits[i] is a digit in the range ['2', '9'].

=end
# @param {String} digits
# @return {String[]}
def letter_combinations(digits)
  return [] if digits.empty?

  @hash = {
    '2': 'abc',
    '3': 'def',
    '4': 'ghi',
    '5': 'jkl',
    '6': 'mno',
    '7': 'pqrs',
    '8': 'tuv',
    '9': 'wxyz'
  }

  @digits = digits
  @result = []
  @combos = []
  dfs(0)
  @result
end

def dfs(index)
  if @combos.size == @digits.size
    @result << @combos.join
    return
  end

  val = @digits[index]
  @hash[val.to_sym].each_char do |ch|
    @combos << ch
    dfs(index + 1)
    @combos.pop
  end
end
