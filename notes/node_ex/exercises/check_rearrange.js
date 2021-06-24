const check = (str1,str2) => {
    if(str1.length > str2.length){
        let temp = str1; 
        str1 = str2; 
        str2 = temp;
    }
    //console.log(str1+str2)
    for (let itr = 0; itr < str1.length; itr++){
        if(str2.search(str1[itr]) === -1) return 'nope'; 
    }
    return 'dope'
}

var str1 = 'full splash', str2 = 'flash', str3 = 'spartans';
console.log('rephrase possible?!!');
console.log(str1 + ' and ' + str2);
console.log(check(str1,str2));
console.log(str1 + ' and ' + str3);
console.log(check(str1,str3));
