# Array chunking

Given an array of elements and a positive integer `size`, write a function that splits the array into subarrays, each of length at most `size`. The function should return an array of these subarrays while maintaining the original order of elements.

Rules
- The function must return an array of arrays.
- The order of elements must be preserved.
- If the input array is empty, the function should return an empty array.
- If size is greater than or equal to the length of the array, return the array wrapped in another array.

```TypeScript
functionName([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 3) // [[1, 2, 3], [4, 5, 6], [7, 8, 9], [10]]
functionName([1,2,3,4,5], 5) // [1,2,3,4,5]
functionName([], 5) // []
functionName([1], 10) // [1]
```
