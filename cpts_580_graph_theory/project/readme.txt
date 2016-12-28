Yang Zhang
11529139

1.	The Implementation of the Algorithm

The Algorithm I used to solve TSP is called Double the Tree. 
The implementation process is that:
i.	Firstly, computes the minimum spinning tree T of the input graph
ii.	And then constructs the Eulerian graph H = 2T by doubling each edge of T. 
iii.	Constructs A Eulerian tour of H. That tour is also a tour in G. 
iv.	Lastly, obtain a Hamiltonian cycle by shortcutting the tour.   

2.	Result
Input: the adjacent matrix of input graph.
Output: The sequence of the TSP tour computed by the algorithm and the total cost.

Exercise 6.4.2
a -> d -> e -> c -> b -> a
The total cost: 15

Exercise 6.4.3
a -> d -> c -> e -> b -> a
The total cost: 29

Exercise 6.4.4
a -> c -> e -> d -> b -> f -> a
The total cost: 36

Exercise 6.4.5
a -> f -> e -> b -> c -> d -> a
The total cost: 35
