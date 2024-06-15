=begin
Design a data structure that supports adding new words and finding if a string matches any previously added string.

Implement the WordDictionary class:

WordDictionary() Initializes the object.
void addWord(word) Adds word to the data structure, it can be matched later.
bool search(word) Returns true if there is any string in the data structure that matches word or false otherwise. word may contain dots '.' where dots can be matched with any letter.

Example:

Input
["WordDictionary","addWord","addWord","addWord","search","search","search","search"]
[[],["bad"],["dad"],["mad"],["pad"],["bad"],[".ad"],["b.."]]
Output
[null,null,null,null,false,true,true,true]

Explanation
WordDictionary wordDictionary = new WordDictionary();
wordDictionary.addWord("bad");
wordDictionary.addWord("dad");
wordDictionary.addWord("mad");
wordDictionary.search("pad"); // return False
wordDictionary.search("bad"); // return True
wordDictionary.search(".ad"); // return True
wordDictionary.search("b.."); // return True

Constraints:

1 <= word.length <= 25
word in addWord consists of lowercase English letters.
word in search consist of '.' or lowercase English letters.
There will be at most 2 dots in word for search queries.
At most 104 calls will be made to addWord and search.

=end

class TrieNode
  attr_accessor :children, :end_of_word

  def initialize
      @children = {}
      @end_of_word = false
  end
end

class WordDictionary
  attr_reader :root

  def initialize()
      @root = TrieNode.new
  end


=begin
  :type word: String
  :rtype: Void
=end
  def add_word(word)
      curr = root

      word.each_char do |ch|
          if !curr.children.key?(ch)
              curr.children[ch] = TrieNode.new
          end
          curr = curr.children[ch]
      end
      curr.end_of_word = true
  end


=begin
  :type word: String
  :rtype: Boolean
=end
  def search(word)
      @word = word
      dfs(0, root)
  end

  def dfs(j, node)
      curr = node
      (j...@word.length).each do |i|
          ch = @word[i]
          if ch == '.'
              curr.children.values.each do |child|
                  return true if dfs(i + 1, child)
              end
              return false
          else
              return false if !curr.children.key?(ch)

              curr = curr.children[ch]
          end
      end
      curr.end_of_word
  end
end

# Your WordDictionary object will be instantiated and called as such:
# obj = WordDictionary.new()
# obj.add_word(word)
# param_2 = obj.search(word)
