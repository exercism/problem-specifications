Write a simple min heap implementation backed by an array.

A binary heap may be represented using an array alone. The root node  
is the first element in the array.  You can get the left child of node  
by `2n + 1` and the right node `2n + 2` where `n` is the index of the parent node.  
You can also get the parent of a child by `(n - 1)/2`. 

A min heap keeps the minimum item as the root. 

```
     1
    / \
   2   7
  / \
 9  4
```

We will implement push, pop and heapify. Other internal functions that would be  
useful to implement are: sift-up and sift-down. 

`push` will push an item to the end of the heap then call `sift-up` to move the item  
to the correct location. `pop` will remove the root item then move the last item on  
the heap to the root. `sift-down` will then be called to move the root item to the  
correct location. 

`heapify` can covert an array of items into heap representation using `push`. 


Other References:  

[Data Structures: Heaps](https://www.youtube.com/watch?v=t0Cq6tVNRBA)  
[Overview video on heap](https://www.youtube.com/watch?v=LhhRbRXhB40)

