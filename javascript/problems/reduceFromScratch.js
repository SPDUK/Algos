const arr = [1,2,3,4,5,6,7];

const _reduce = (fn, acc, [head, ...tail]) => {
  if (!head) return acc;
  return _reduce(fn, fn(acc, head), tail);
}

// single expression with ternary
const _reduceTwo = (fn, acc, [head, ...tail]) => 
head ? _reduceTwo(fn, fn(acc, head), tail) 
: acc



console.log(_reduce((x, y) => x + y, 0, arr))
// 28

console.log(_reduceTwo((x, y) => x + y, 0, arr))
// 28

