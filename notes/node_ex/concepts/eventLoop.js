const fs = require('fs');
const { setTimeout } = require('timers');

const print = (str) => {
    console.log(str);
}

function doSomeWork(){
    let i = 1E8;
    while (i>0) {i--};
}

let startTime = Date.now();

print("Calling timeout");
setTimeout(timeoutCb,10);

print("Calling readFile");
fs.readFile('abc.txt',fileCb);

print("Calling immediate");
setImmediate(immediateCb);

print("Calling next tick");
process.nextTick(nxtickCb);

function fileCb(){
    let now = Date.now();
    doSomeWork();
    console.log("After file read, time eleapsed: " + (now - startTime));
}

function immediateCb(){
    let now = Date.now();
    doSomeWork();
    console.log("After Immediate, time eleapsed: " + (now - startTime));
}

function timeoutCb(){
    let now = Date.now();
    doSomeWork();
    console.log("After timeout, time eleapsed: " + (now - startTime));
}

function nxtickCb(){
    let now = Date.now();
    doSomeWork();
    console.log("After next tick, time eleapsed: " + (now - startTime));
}