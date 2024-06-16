=begin
Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.

Example 1:

Input: n = 3
Output: ["((()))","(()())","(())()","()(())","()()()"]

Example 2:

Input: n = 1
Output: ["()"]

Constraints:

1 <= n <= 8

=end

# @param {Integer} n
# @return {String[]}
def generate_parenthesis(n)
  @result = []
  @n = n
  backtrack('', 0, 0)
  @result
end

def backtrack(curr_str, open_count, close_count)
  if curr_str.length == 2 * @n
    @result << curr_str
    return
  end

  if open_count < @n
    backtrack(curr_str + '(', open_count + 1, close_count)
  end

  if open_count > close_count
    backtrack(curr_str + ')', open_count, close_count + 1)
  end
end
