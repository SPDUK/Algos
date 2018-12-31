// base case
// divide: break problem down with each call
// conquer: do work on each subset
// combine solutions

// divide into many subarrays of 1, then merge and double the length each time

// merge routine
// lPoint, rPoint = 0
// output array = []
// loop until L and R .length are same as array.length

// if l[lPoint] > r[rPoint]
// push lower number (r[0]) to output array,  rPointer++
// else push L[lPoint] into output array, lPoint++

// in this case instead of using pointers we naturally point to the next index in the array by removing the first index and just use the first element all the time

function mergeArrays(leftArr, rightArr) {
  const sortedArr = [];

  // while we can make a comparison between both arrays,
  while (leftArr.length && rightArr.length) {
    // find the lowest number at the [0] index of each array, then shift it (mutates original array, returns the element at index 0),
    // push that returned number into sortedArr
    if (leftArr[0] <= rightArr[0]) sortedArr.push(leftArr.shift());
    else sortedArr.push(rightArr.shift());
  }

  // if there is just one element left then it is larger so we add it to the end
  // if there is more than one element then they are already sorted previously, and also larger, so we add them to the end
  if (leftArr.length) sortedArr.push(...leftArr);
  if (rightArr.length) sortedArr.push(...rightArr);

  return sortedArr;
}

function mergeSort(arr) {
  // no need to compare if there is just one (or no) elements
  if (arr.length <= 1) return arr;

  const middleIdx = Math.floor(arr.length / 2);
  const leftArr = arr.slice(0, middleIdx);
  const rightArr = arr.slice(middleIdx);

  const leftSplit = mergeSort(leftArr);
  const rightSplit = mergeSort(rightArr);

  return mergeArrays(leftSplit, rightSplit);
}

module.exports = mergeSort;
