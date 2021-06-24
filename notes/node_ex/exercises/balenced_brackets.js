const balencedBrackets = (str) => {
    let openBracs  = ['[','{','('];
    let closeBracs = [']','}',')'];
    const stack = [];
    const bracs ={
        '[' : ']',
        '{' : '}',
        '(' : ')'
    }
    for (let itr = 0; itr < str.length; itr++){
        if(!openBracs.includes(str[itr]) || !closeBracs.includes(str[itr])){
            continue;
        }
        if(openBracs.includes(str[itr])){
            stack.push(str[itr]);
        }
        else if(closeBracs.includes(str[itr])){
            if (!stack.length){
                return 'not a valid closure';
            }
            if(bracs[stack.pop()] !== str[itr]){
                return 'not a valid closure';
            }
        }
    }
    return 'valid closure';
}


var str = 'for (let itr = 0; itr < str.length; itr++){'+
'    if(openBracs.includes(str[itr])){ '+
'        stack.push(str[itr]);'+
'    }'+
'    else if(closeBracs.includes(str[itr])){'+
'        if (!stack.length){'+
'            return "not a valid closure";'+
'        }'+
'        if(bracs[stack.pop()] !== str[itr]){'+
'            return "not a valid closure";'+
'        }'+
'    }'+
'}'
console.log(balencedBrackets(str));