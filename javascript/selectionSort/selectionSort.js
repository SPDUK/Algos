function findSmallest(arr) {
  let smallest = arr[0];
  let smallestIdx = 0;
  arr.forEach((el, i) => {
    if (el < smallest) {
      smallest = el;
      smallestIdx = i;
    }
  });
  return smallestIdx;
}

// because we are mutating the original array we use a while loop, a for loop using the length would end too early
function selectionSort(arr) {
  const newArr = [];

  while (arr.length) {
    // find the smallest element in the array and push it to the end
    const smallest = findSmallest(arr);
    const poppedEl = arr.splice(smallest, 1);
    newArr.push(...poppedEl); // spread poppedEl eg: [6] becomes 6
  }

  return newArr;
}

module.exports = selectionSort;
