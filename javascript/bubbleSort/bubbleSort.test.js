const bubbleSort = require("./bubbleSort.js");

test("Should not unsort the numbers", () => {
  expect(bubbleSort([1, 2, 3, 4, 5, 6])).toEqual([1, 2, 3, 4, 5, 6]);
});

test("Should sort the numbers", () => {
  expect(bubbleSort([1, 6, 3, 5, 2, 4])).toEqual([1, 2, 3, 4, 5, 6]);
});

test("Should sort the numbers", () => {
  expect(bubbleSort([6, 5, 4, 3, 2, 1])).toEqual([1, 2, 3, 4, 5, 6]);
});

test("Should sort the numbers", () => {
  expect(bubbleSort([30, 84, 4, 80, 2, 1])).toEqual([1, 2, 4, 30, 80, 84]);
});
