=begin
Roman numerals are represented by seven different symbols: I, V, X, L, C, D and M.

Symbol       Value
I             1
V             5
X             10
L             50
C             100
D             500
M             1000
For example, 2 is written as II in Roman numeral, just two ones added together. 12 is written as XII, which is simply X + II. The number 27 is written as XXVII, which is XX + V + II.

Roman numerals are usually written largest to smallest from left to right. However, the numeral for four is not IIII. Instead, the number four is written as IV. Because the one is before the five we subtract it making four. The same principle applies to the number nine, which is written as IX. There are six instances where subtraction is used:

I can be placed before V (5) and X (10) to make 4 and 9.
X can be placed before L (50) and C (100) to make 40 and 90.
C can be placed before D (500) and M (1000) to make 400 and 900.
Given a roman numeral, convert it to an integer.

Example 1:

Input: s = "III"
Output: 3
Explanation: III = 3.
Example 2:

Input: s = "LVIII"
Output: 58
Explanation: L = 50, V= 5, III = 3.
Example 3:

Input: s = "MCMXCIV"
Output: 1994
Explanation: M = 1000, CM = 900, XC = 90 and IV = 4.

Constraints:

1 <= s.length <= 15
s contains only the characters ('I', 'V', 'X', 'L', 'C', 'D', 'M').
It is guaranteed that s is a valid roman numeral in the range [1, 3999].
=end

# @param {String} s
# @return {Integer}
def roman_to_int(s)
  roman_symbols = { "I" => 1, "V"=> 5, "X" => 10, "L" => 50, "C" => 100, "D" => 500, "M" => 1000 }
  roman_array = s.chars
  new_roman_array = []
  for index in 0..(roman_array.length - 1) do
      if roman_array[index] == "I" && roman_array[index + 1] == ("V")
          new_roman_array[index] = 4
          roman_array.delete_at(index + 1)
      elsif roman_array[index] == "I" && roman_array[index + 1] == ("X")
          new_roman_array[index] = 9
          roman_array.delete_at(index + 1)
      elsif roman_array[index] == "X" && roman_array[index + 1] == ("L")
          new_roman_array[index] = 40
          roman_array.delete_at(index + 1)
      elsif roman_array[index] == "X" && roman_array[index + 1] == ("C")
          new_roman_array[index] = 90
          roman_array.delete_at(index + 1)
      elsif roman_array[index] == "C" && roman_array[index + 1] == ("D")
          new_roman_array[index] = 400
          roman_array.delete_at(index + 1)
      elsif roman_array[index] == "C" && roman_array[index + 1] == ("M")
          new_roman_array[index] = 900
          roman_array.delete_at(index + 1)
      else
          new_roman_array[index] = roman_symbols[roman_array[index]]
      end
  end

  new_roman_array.compact.sum
end
