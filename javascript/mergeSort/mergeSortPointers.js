function mergeArrays(left, right) {
  let sorted = [];
  let lPoint = 0;
  let rPoint = 0;

  while (sorted.length < left.length + right.length) {
    if (lPoint === left.length) sorted = sorted.concat(right.slice(rPoint));
    else if (rPoint === right.length) sorted = sorted.concat(left.slice(lPoint));
    else if (left[lPoint] <= right[rPoint]) {
      sorted.push(left[lPoint]);
      lPoint += 1;
    } else {
      sorted.push(right[rPoint]);
      rPoint += 1;
    }
  }

  return sorted;
}

function mergeSortPointers(arr) {
  if (arr.length <= 1) return arr;

  const middleIdx = Math.floor(arr.length / 2);
  const leftArr = arr.slice(0, middleIdx);
  const rightArr = arr.slice(middleIdx);

  const leftSplit = mergeSortPointers(leftArr);
  const rightSplit = mergeSortPointers(rightArr);

  return mergeArrays(leftSplit, rightSplit);
}

module.exports = mergeSortPointers;

// var sorted = [],
//   lPoint = 0,
//   rPoint = 0;

// // while sorted is not fully populated
// while (sorted.length < left.length + right.length) {
//   // if all elements in left have been added, then add remaining right elements
//   if (lPoint === left.length) sorted = sorted.concat(right.slice(rPoint));
//   // if all elements in right have been added, then add remaining left elements
//   else if (rPoint === right.length) sorted = sorted.concat(left.slice(lPoint));
//   // compare elements in subarrays and add lower of the two to sorted
//   else if (left[lPoint] <= right[rPoint]) sorted.push(left[lPoint++]);
//   else sorted.push(right[rPoint++]);
// }
// return sorted;
