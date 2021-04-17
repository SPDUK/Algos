const isPalindrome = require('.');

test('leetcode solutions', () => {
  expect(isPalindrome('A man, a plan, a canal: Panama')).toBe(true);
  expect(isPalindrome('race a car')).toBe(false);

  expect(isPalindrome('ab_a')).toBe(true);
});
