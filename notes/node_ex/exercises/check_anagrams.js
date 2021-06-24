const checkAnagrams = (str1,str2) => {
    if (str1.length !== str2.length) return 'nope';
    str1 = str1.split('').sort();
    str2 = str2.split('').sort();
    if (str1.join('') == str2.join('')) return 'dope';
    else return 'nope';
}

var str1 = 'mat', str2 = 'tam', str3 = 'fat';
console.log('Anagrams?!!');
console.log(str1 + ' and ' + str2);
console.log(checkAnagrams(str1,str2));
console.log(str1 + ' and ' + str3);
console.log(checkAnagrams(str1,str3));