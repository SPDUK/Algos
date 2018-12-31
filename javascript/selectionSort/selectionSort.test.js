const selectionSort = require('./selectionSort.js');

test('Should not unsort the numbers', () => {
  expect(selectionSort([1, 2, 3, 4, 5, 6])).toEqual([1, 2, 3, 4, 5, 6]);
});

test('Should sort the numbers', () => {
  expect(selectionSort([1, 6, 3, 5, 2, 4])).toEqual([1, 2, 3, 4, 5, 6]);
});

test('Should sort the numbers', () => {
  expect(selectionSort([6, 5, 4, 3, 2, 1])).toEqual([1, 2, 3, 4, 5, 6]);
});

test('Should not infinite loop', () => {
  expect(selectionSort([])).toEqual([]);
});
