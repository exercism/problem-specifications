In this exercise, lets try to solve a classic problem.

Bob is a thief. After months of planning, he finally managed to crack the security systems of a high-class apartment. In front of him are many items, each with a value (V). Bob of course wants to maximise the total value he can get; he would of course take all the items if he could. However, to his horrer, he realised that the knapsack he carried with him can only hold a weight W.

Given a knapsack of weight W, can you help Bob determine the maximum value he can get from the items in the house? Note, you can take only one of each item.

For example:

Item Values: [10, 40, 30, 50]
Item Weight: [5, 4, 6, 4]
Knapsack Limit: 10


For the above, item 1 has weight 5 and value 10, items 2 has weight 4 and value 40, and so on...

Bob should take item 2 and 4 to maximise his value which in this case is 90. He cannot get more than 90 as his knapsack has a limit of 10


Follow-Up:
1. What if now we can take up to C copies of an item? (C is an integer) Can you do this efficiently? Hint: O(Log(C) * NW) time, where N and W is the number of items and W is the maximum weight respectively
