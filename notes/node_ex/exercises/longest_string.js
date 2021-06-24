function longest(arr){
    let max = 0;
    let maxStr = ''
    for (let itr=0; itr < arr.length; itr++ ){
        if (arr[itr].length > max){
            maxStr = arr[itr];
            max = arr[itr].length;
        } 
    }
    return maxStr;
}

const arr = ['hi','this','is','the','test','array','containing','strings'];
console.log("Longest String is: " + longest(arr));