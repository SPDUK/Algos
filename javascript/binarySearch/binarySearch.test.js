const binarySearch = require("./binarySearch.js");

test("Not finding the item should be -1", () => {
  expect(binarySearch([1, 2, 3, 4, 5, 6], 1)).toBe(0);
});

test("Finds the item at the start of the list", () => {
  expect(binarySearch([1, 2, 3, 4, 5, 6], 1)).toBe(0);
});

test("Finds the item at the middle of the list", () => {
  expect(binarySearch([11, 23, 25, 38, 49], 25)).toBe(2);
});

test("Finds the item at the end of the list", () => {
  expect(binarySearch([88, 891, 998, 999, 1003, 5999, 9999, 10002], 10002)).toBe(7);
});
