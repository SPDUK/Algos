function binarySearch(arr, item) {
  let low = 0;
  let high = arr.length - 1;

  while (low <= high) {
    const mid = Math.floor(low + (high - low) / 2);

    if (arr[mid] === item) return mid;

    if (arr[mid] < item) low = mid + 1;

    else high = mid - 1;
  }

  return -1;
}

module.exports = binarySearch;
