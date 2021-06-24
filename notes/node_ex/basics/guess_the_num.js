/*function get()
{
    let num = 0;
    const readline = require('readline').createInterface({
        input: process.stdin,
        output: process.stdout
      });
       
      readline.question('Enter the number', num => {
        console.log(`got ${num}!`)
        readline.close()
      });
      return num;
}*/

function cheak(num)
{
    if (num < realNum) console.log(" \nBit Low ");
    if (num > realNum) console.log(" \nBit High ");
    if (num == undefined) return false;
    else return true;
    return false;
}
var realNum = 44;

console.log("------------------------------------------------------------------------------------");
console.log("--------------------------         Guess the number         ------------------------");
console.log("------------------------------------------------------------------------------------");

var itr = 0;

for(;;)
{
    let num;
    const readline = require('readline').createInterface({
        input: process.stdin,
        output: process.stdout
      })
      
      readline.question(`Enter the Number`, num => {
        console.log(`got ${num}!`)
        readline.close()
      })
    if (cheak(num)) console.log("\nSuccuess");
    else console.log(" \nTry Again ")
    itr++;
}
console.log(" Great You have guessed the number correctly as " + realNum +" with "+ itr +" chances ");