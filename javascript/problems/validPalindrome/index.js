function isPalindrome(str) {
  const sanitisedStr = str.match(/[a-zA-Z0-9]/g)?.map((s) => s.toLowerCase());

  if (!sanitisedStr) return true;

  return sanitisedStr.join('') === sanitisedStr.reverse().join('');
}

module.exports = isPalindrome;
