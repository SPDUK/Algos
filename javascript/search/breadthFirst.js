function isSeller(person) {
  return person === 'Jim';
}
// search through a list of friends to see which person is selling something
// start out at you, look through your friends, then their friends, and repeat until you find the seller
function breadthFirst(people) {
  // keep a queue containing people to check, start with "You"
  const queue = ['You'];
  while (queue.length > 0) {
    // shift a person off the start of the queue
    const person = queue.shift();
    // check if that person is a seller
    if (isSeller(person)) {
      // return true if we found the seller
      console.log(`${person} is a seller!`);
      return true;
    }
    //  else add each of their neighbors to the queue
    queue.push(...people[person]);
  }
  // repeat until queue is empty, false if no sellers
  console.log('No seller was found!');
  return false;
}
const friends = {
  You: ['Amy', 'Joe', 'Ben'],
  Amy: ['Annie', 'Claire', 'Peggy'],
  Joe: ['Peggy', 'John'],
  Peggy: ['John', 'Jim'],
  Annie: ['Joe', 'Amy'],
  Claire: ['Bob'],
  Ben: ['Joe', 'John', 'Bob'],
  Bob: ['Amy'],
  Jim: ['Bob'],
  John: ['Amy']
};

const result = breadthFirst(friends);
console.log(result);
module.exports = breadthFirst;
