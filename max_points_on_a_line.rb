=begin
Given an array of points where points[i] = [xi, yi] represents a point on the X-Y plane, return the maximum number of points that lie on the same straight line.

Example 1:

Input: points = [[1,1],[2,2],[3,3]]
Output: 3

Example 2:

Input: points = [[1,1],[3,2],[5,3],[4,1],[2,3],[1,4]]
Output: 4

Constraints:

1 <= points.length <= 300
points[i].length == 2
-104 <= xi, yi <= 104
All the points are unique.

=end

# @param {Integer[][]} points
# @return {Integer}
def max_points(points)
  n = points.size
  return n if n < 3

  limit = n - 1
  tally = Hash.new(0)
  points.each_with_index do |(x1, y1),i|
    (i + 1).upto(limit) do |j|
      x2, y2 = points[j]
      if x1 == x2
        tally[x1] += 1
      else
        k = Rational(y2 - y1, x2 - x1) # y = k * x + b
        b = y1 - (k * x1)
        tally[[k,b]] += 1
      end
    end
  end
  max = tally.values.max
  res = (1 + Math.sqrt(1 + max << 3).round) >> 1
end
