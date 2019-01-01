// function bubbleSort(arr) {
//   let wall = arr.length;
//   while (wall >= 0) {
//     for (let i = 0; i < wall; i++) {
//       if (arr[i] > arr[i + 1]) {
//         // swap the current element with the next element, and the next elment with the current element | [...20, 5...] becomes [...5, 20...]
//         [arr[i], arr[i + 1]] = [arr[i + 1], arr[i]];
//       }
//     }
//     wall--;
//   }
//   return arr;
// }

// module.exports = bubbleSort;

function bubbleSort(arr) {
  for (let i = 0; i < arr.length; i++) {
    for (let j = 0; j < arr.length; j++) {
      if (arr[j] > arr[j + 1]) {
        // swap the current element with the next element, and the next elment with the current element | [...20, 5...] becomes [...5, 20...]
        [arr[j], arr[j + 1]] = [arr[j + 1], arr[j]];
      }
    }
  }
  return arr;
}

module.exports = bubbleSort;
