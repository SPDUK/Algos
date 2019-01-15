// choose a pivot point (usually last number)
// base case is an empty list or 1  ---- already sorted
// loop through
// swap all elements that are larger to the right
// all elements that are smaller keep to the left
// create 2 arrays from the smaller/larger sides of the pivot


// [5,7,4,9,6]

// [5,4]  --6--  [7,9]

// first half [5,4]
// []  --4--  [5]
// return [4,5], concat the larger list on the end of the pivot of 4, so we return [4,5]


// second half [7,9]
// [7] --9-- []
// return [7,9],  concat the lower list of [7] to the 9 because it is lower

// after sorting first and second half recursively we have it sorted
// [4,5] --6-- [7,9]
// return [4,5,6,7,9], join the smaller before the pivot, and then the larger after


function quickSort(nums) {
  if (nums.length <= 1) return nums;

  const lower = [];
  const higher = [];
  const pivot = nums[nums.length - 1];

  // loop from the start TO the last number, not including the last number (pivot)
  for (let i = 0; i < nums.length - 1; i += 1) {
    if (nums[i] < pivot) lower.push(nums[i]);
    else higher.push(nums[i]);
  }

  return [...quickSort(lower), pivot, ...quickSort(higher)];
}


module.exports = quickSort;
