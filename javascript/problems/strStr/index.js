function strStr(haystack, needle) {
  // return haystack.indexOf(needle); // easy solution

  if (haystack === needle) return 0;

  let result = -1;

  for (let i = 0; i < haystack.length; i += 1) {
    if (haystack.slice(i, i + needle.length) === needle) {
      result = i;
      break;
    }
  }

  return result;
}

module.exports = strStr;
