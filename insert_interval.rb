=begin
You are given an array of non-overlapping intervals intervals where intervals[i] = [starti, endi] represent the start and the end of the ith interval and intervals is sorted in ascending order by starti. You are also given an interval newInterval = [start, end] that represents the start and end of another interval.

Insert newInterval into intervals such that intervals is still sorted in ascending order by starti and intervals still does not have any overlapping intervals (merge overlapping intervals if necessary).

Return intervals after the insertion.

Note that you don't need to modify intervals in-place. You can make a new array and return it.

Example 1:

Input: intervals = [[1,3],[6,9]], newInterval = [2,5]
Output: [[1,5],[6,9]]

Example 2:

Input: intervals = [[1,2],[3,5],[6,7],[8,10],[12,16]], newInterval = [4,8]
Output: [[1,2],[3,10],[12,16]]
Explanation: Because the new interval [4,8] overlaps with [3,5],[6,7],[8,10].

Constraints:

0 <= intervals.length <= 104
intervals[i].length == 2
0 <= starti <= endi <= 105
intervals is sorted by starti in ascending order.
newInterval.length == 2
0 <= start <= end <= 105

=end
# @param {Integer[][]} intervals
# @param {Integer[]} new_interval
# @return {Integer[][]}
def insert(intervals, new_interval)
  zero_hold = new_interval[0]
  one_hold = new_interval[1]

  #outside and below
  #outside and above
  answer = intervals.map { |int| int if new_interval[0] > int[1] || new_interval[1] < int[0] }.compact

  intervals.each do |int|
      # 0 is inside
      zero_hold = new_interval[0].between?(int[0], int[1]) ? int[0] : zero_hold
      # 1 is inside
      one_hold = new_interval[1].between?(int[0], int[1]) ? int[1] : one_hold
  end

  answer << [zero_hold, one_hold]
  answer.sort
end
