const maxC = (charDict) =>{
    let maxN=Math.max.apply(null,Object.values(charDict))
    for ( let element in charDict){
        if (charDict[element] == maxN) return (element + ' - ' + charDict[element] + ' times');
    }
    return null
}
const checkForChar = (str) =>{
    const charDict = {}
    for (let itr = 0; itr < str.length; itr++){
        charDict[str[itr]]=0;
    }
    for (let itr = 0; itr < str.length; itr++){
        charDict[str[itr]]++;
    }
    return maxC(charDict)
}

let str = 'mugunthan';
console.log(checkForChar(str));