const fs = require('fs');

const balencedBrackets = (err,str) => { 

    if(err) console.log ('Error');

    let openBracs  = ['[','{','('];
    let closeBracs = [']','}',')'];
    const stack = [];
    const bracs ={
        '[' : ']',
        '{' : '}',
        '(' : ')'
    }
    for (let itr = 0; itr < str.length; itr++){

        if(openBracs.includes(str[itr])){
            stack.push(str[itr]);
        }
        else if(closeBracs.includes(str[itr])){
            if (!stack.length){
                console.log ('not a valid closure');
                return;
            }
            if(bracs[stack.pop()] !== str[itr]){
                console.log ('not a valid closure');
                return;
            }
        }
        else 
            continue;
    }
    console.log ((stack.length == 0)? 'valid closure': 'not a valid closure');
    return;
}

fs.readFile('test.txt','utf8',balencedBrackets)