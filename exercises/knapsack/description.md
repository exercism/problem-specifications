In this exercise, lets try to solve a classic problem.

Bob is a thief. After months of carefuly planning, he finally manages to crack the security systems of a high-class apartment. 

In front of him are many items, each with a value (v) and weight (w). Bob of course wants to 
maximize the total value he can get; he would gladly take all of the items if he could. 
However, to his horror, he realized that the knapsack he carried with him can only hold so much weight(W).

Given a knapsack with a specific capacity (W), can you help Bob determine the maximum value he can get from the items in the house? Note, Bob can only take only one of each item. 

All values given will be strictly positive integers.Items will be represented as a list of pairs, 
[wi, vi] where the first element `wi` is the weight of the ith item and `vi` is the value for 
that item.

For example:

Items: [[5, 10], [4, 40], [6, 30], [4, 50]]
Knapsack Limit: 10


For the above, item 1 has weight 5 and value 10, items 2 has weight 4 and value 40, and so on...

Bob should take item 2 and 4 to maximize his value which in this case is 90. He cannot get more 
than 90 as his knapsack has a weight limit of 10
