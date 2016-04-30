The challenge is to write a function that accepts an arbitrarily-deep nested Array-like structure and returns a flattened structure with any null values removed without using the reduce method.

For Example

flattener.flatten([0, 2, [[2, 3], 8, 100, null, [[null]]], -2]);

returns [0, 2, 2, 3, 8, 100, -2]


flattener.clear()

returns []

Tips

* Define clear first before the function flatten
* Think about closures and know what you have access to within a function

Have Fun, very popular interview question
