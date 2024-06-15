=begin
You are given an array of variable pairs equations and an array of real numbers values, where equations[i] = [Ai, Bi] and values[i] represent the equation Ai / Bi = values[i]. Each Ai or Bi is a string that represents a single variable.

You are also given some queries, where queries[j] = [Cj, Dj] represents the jth query where you must find the answer for Cj / Dj = ?.
Return the answers to all queries. If a single answer cannot be determined, return -1.0.

Note: The input is always valid. You may assume that evaluating the queries will not result in division by zero and that there is no contradiction.
Note: The variables that do not occur in the list of equations are undefined, so the answer cannot be determined for them.

Example 1:

Input: equations = [["a","b"],["b","c"]], values = [2.0,3.0], queries = [["a","c"],["b","a"],["a","e"],["a","a"],["x","x"]]
Output: [6.00000,0.50000,-1.00000,1.00000,-1.00000]
Explanation:
Given: a / b = 2.0, b / c = 3.0
queries are: a / c = ?, b / a = ?, a / e = ?, a / a = ?, x / x = ?
return: [6.0, 0.5, -1.0, 1.0, -1.0 ]
note: x is undefined => -1.0

Example 2:

Input: equations = [["a","b"],["b","c"],["bc","cd"]], values = [1.5,2.5,5.0], queries = [["a","c"],["c","b"],["bc","cd"],["cd","bc"]]
Output: [3.75000,0.40000,5.00000,0.20000]

Example 3:

Input: equations = [["a","b"]], values = [0.5], queries = [["a","b"],["b","a"],["a","c"],["x","y"]]
Output: [0.50000,2.00000,-1.00000,-1.00000]

Constraints:

1 <= equations.length <= 20
equations[i].length == 2
1 <= Ai.length, Bi.length <= 5
values.length == equations.length
0.0 < values[i] <= 20.0
1 <= queries.length <= 20
queries[i].length == 2
1 <= Cj.length, Dj.length <= 5
Ai, Bi, Cj, Dj consist of lower case English letters and digits.
=end
# @param {String[][]} equations
# @param {Float[]} values
# @param {String[][]} queries
# @return {Float[]}
def calc_equation(equations, values, queries)
    @adj = Hash.new { |h,k| h[k] = [] }

    equations.each_with_index do |eq, i|
        a, b = eq
        @adj[a] << [b, values[i]]
        @adj[b] << [a, 1 / values[i]]
    end

    result = []
    queries.each do |q|
        result << bfs(q[0], q[1]).to_f
    end
    result
end

def bfs(src, target)
    if !@adj.key?(src) || !@adj.key?(target)
        return -1
    end

    queue = []
    queue << [src, 1]

    visited = Set.new
    visited << src

    while !queue.empty?
        curr_node, curr_weight = queue.shift

        if curr_node == target
            return curr_weight
        end

        @adj[curr_node].each do |node, wt|
            if !visited.include?(node)
                queue << [node, curr_weight * wt]
                visited << node
            end
        end
    end
    -1
end
