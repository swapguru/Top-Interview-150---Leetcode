=begin
There are n children standing in a line. Each child is assigned a rating value given in the integer array ratings.

You are giving candies to these children subjected to the following requirements:

Each child must have at least one candy.
Children with a higher rating get more candies than their neighbors.
Return the minimum number of candies you need to have to distribute the candies to the children.

Example 1:

Input: ratings = [1,0,2]
Output: 5
Explanation: You can allocate to the first, second and third child with 2, 1, 2 candies respectively.
Example 2:

Input: ratings = [1,2,2]
Output: 4
Explanation: You can allocate to the first, second and third child with 1, 2, 1 candies respectively.
The third child gets 1 candy because it satisfies the above two conditions.

Constraints:

n == ratings.length
1 <= n <= 2 * 104
0 <= ratings[i] <= 2 * 104
=end

# @param {Integer[]} ratings
# @return {Integer}
def candy(ratings)
  candies = [1] * ratings.size

  ratings.each_with_index do |rating, index|
    next if index == 0
    candies[index] = candies[index - 1] + 1 if rating > ratings[index - 1]
  end

  (ratings.size - 2).downto(0) do |index|
    r = ratings[index]

    if r > ratings[index + 1] && candies[index + 1] >= candies[index]
      candies[index] = candies[index + 1] + 1
    end
  end

  candies.sum
end
