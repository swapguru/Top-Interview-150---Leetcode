=begin
A gene string can be represented by an 8-character long string, with choices from 'A', 'C', 'G', and 'T'.

Suppose we need to investigate a mutation from a gene string startGene to a gene string endGene where one mutation is defined as one single character changed in the gene string.

For example, "AACCGGTT" --> "AACCGGTA" is one mutation.

There is also a gene bank bank that records all the valid gene mutations. A gene must be in bank to make it a valid gene string.

Given the two gene strings startGene and endGene and the gene bank bank, return the minimum number of mutations needed to mutate from startGene to endGene. If there is no such a mutation, return -1.

Note that the starting point is assumed to be valid, so it might not be included in the bank.

Example 1:

Input: startGene = "AACCGGTT", endGene = "AACCGGTA", bank = ["AACCGGTA"]
Output: 1

Example 2:

Input: startGene = "AACCGGTT", endGene = "AAACGGTA", bank = ["AACCGGTA","AACCGCTA","AAACGGTA"]
Output: 2

Constraints:

0 <= bank.length <= 10
startGene.length == endGene.length == bank[i].length == 8
startGene, endGene, and bank[i] consist of only the characters ['A', 'C', 'G', 'T'].

=end

# @param {String} start_gene
# @param {String} end_gene
# @param {String[]} bank
# @return {Integer}
def min_mutation(start_gene, end_gene, bank)
    queue = []
    visited = Set.new
    queue << start_gene
    visited << start_gene

    steps = 0
    while !queue.empty?
        queue.size.times do
            curr_gene = queue.shift

            # if we find the end gene
            return steps if curr_gene == end_gene

            'ACGT'.each_char do |ch|
                (0...curr_gene.length).each do |i|
                    neighbor = curr_gene.dup
                    neighbor[i] = ch

                    if !visited.include?(neighbor) && bank.include?(neighbor)
                        visited << neighbor
                        queue << neighbor
                    end
                end
            end
        end
        steps += 1
    end
    -1 # if we do not encounter end_gene after swaps
end
