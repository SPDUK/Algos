// go through each paren in the stack
// if opening bracket - push to stack
// If closing bracket - pop off last item
// return true if stack is empty, return false if stack has a length (open bracket)
// return false if the stack is invalid (too many closing brackets before opening next)

function isValid(parens) {
  function reduceParens(stack, bracket) {
    if (bracket === '(') stack.push(bracket);
    else if (bracket === ')' && stack[stack.length - 1] === '(') stack.pop();
    else return false; // return false if stack is invalid
    return stack;
  }
  return parens.split('').reduce(reduceParens, []).length === 0;
}

console.log(isValid('((((((()))))))')); // true
console.log(isValid('()')); // true
console.log(isValid('((((((())))))')); // false
console.log(isValid('(')); // false
console.log(isValid(')')); // false
console.log(isValid('(()')); // false
console.log(isValid('(((((()))))))))')); // false
