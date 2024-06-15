=begin
Given an m x n board of characters and a list of strings words, return all words on the board.

Each word must be constructed from letters of sequentially adjacent cells, where adjacent cells are horizontally or vertically neighboring. The same letter cell may not be used more than once in a word.

Example 1:

Input: board = [["o","a","a","n"],["e","t","a","e"],["i","h","k","r"],["i","f","l","v"]], words = ["oath","pea","eat","rain"]
Output: ["eat","oath"]

Example 2:

Input: board = [["a","b"],["c","d"]], words = ["abcb"]
Output: []

Constraints:

m == board.length
n == board[i].length
1 <= m, n <= 12
board[i][j] is a lowercase English letter.
1 <= words.length <= 3 * 104
1 <= words[i].length <= 10
words[i] consists of lowercase English letters.
All the strings of words are unique.

=end

# @param {Character[][]} board
# @param {String[]} words
# @return {String[]}
class TrieNode
  attr_accessor :children, :end_of_word

  def initialize
      @children = {}
      @end_of_word = false
  end

  def add_word(word)
      curr = self
      word.each_char do |ch|
          if !curr.children.key?(ch)
              curr.children[ch] = TrieNode.new
          end
          curr = curr.children[ch]
      end
      curr.end_of_word = true
  end
end

def find_words(board, words)
  root = TrieNode.new
  words.each do |word|
      root.add_word(word)
  end

  @rows = board.length
  @cols = board[0].length
  @result = Set.new
  @visited = Set.new
  @board = board

  (0...@rows).each do |r|
      (0...@cols).each do |c|
          if root.children.key?(@board[r][c])
              dfs(r, c, root, '')
          end
      end
  end
  @result.to_a
end

def dfs(r, c, node, word)
  return if r < 0 || r >= @rows || c < 0 || c >= @cols || @visited.include?([r,c]) || !node.children.key?(@board[r][c])

  @visited << [r,c]

  ch = @board[r][c]

  # set node to children of the current character that we visited
  child_node = node.children[ch]

  # add current character to word
  word += ch

  @result << word if child_node.end_of_word # if we found the word

  dfs(r + 1, c, child_node, word)
  dfs(r - 1, c, child_node, word)
  dfs(r, c + 1, child_node, word)
  dfs(r, c - 1, child_node, word)

  @visited.delete([r,c])

  # Optimization to avoid TLE
  if child_node.children.empty?
      node.children.delete(ch)
  end
end
