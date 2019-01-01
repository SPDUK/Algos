const bubbleSort = require('./bubbleSort');
const mergeSort = require('./mergeSort');
const mergeSortPointers = require('./mergeSortPointers');
const selectionSort = require('./selectionSort');
const quickSort = require('./quickSort');

const sorts = [bubbleSort, mergeSort, mergeSortPointers, selectionSort, quickSort];

for (const sort of sorts) {
  test('Should not unsort the numbers', () => {
    expect(sort([1, 2, 3, 4, 5, 6])).toEqual([1, 2, 3, 4, 5, 6]);
  });

  test('Should sort the numbers', () => {
    expect(sort([1, 6, 3, 5, 2, 4])).toEqual([1, 2, 3, 4, 5, 6]);
  });

  test('Should sort the numbers', () => {
    expect(sort([6, 5, 4, 3, 2, 1])).toEqual([1, 2, 3, 4, 5, 6]);
  });

  test('Should not infinite loop', () => {
    expect(sort([])).toEqual([]);
  });
  test('Should work on a single element', () => {
    expect(sort([1])).toEqual([1]);
  });
}
