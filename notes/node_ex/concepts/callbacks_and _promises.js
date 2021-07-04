
//Shandard Callback Pattern
//https://www.tutorialkart.com/nodejs/node-js-callback-function/

//synchronous call
function add(num1,num2){
	return num1+num2;
}

var sum = add(3,5);
console.log(sum);
//-----------------------------------------------
//asynchronous call
function addOnServer(num1,num2){
	setTimeout(function(){ return num1+num2; }, 3000);
}

var sum = addOnServer(3,5);
console.log(sum);
//-----------------------------------------------
//named function
function addOnServer(num1,num2,callback){
	setTimeout(function(){ callback(num1+num2); }, 3000);
}

function printSum(sum){
	console.log(sum);
}

addOnServer(3,5,printSum);
//-----------------------------------------------
//anonymous function
function addOnServer(num1,num2,callback){
	setTimeout(function(){ callback(num1+num2); }, 3000);
}

addOnServer(5,5,function(sum){
	console.log(sum);
});
//-----------------------------------------------
//returning Err
function addOnServer(num1,num2,callback){
	setTimeout(function(){
		if(isNaN(num1) || isNaN(num2)){
			callback('invalid parameters',null)
		}else{
			callback(null,num1+num2);
		}
	}, 3000);
}

addOnServer(5,'a',function(err,sum){
	if(err){
		console.log('Error: '+ err);
	}else{
		console.log(sum);
	}
});
//-----------------------------------------------
//nested callback
function addOnServer(num1,num2,callback){
	setTimeout(function(){
		if(isNaN(num1) || isNaN(num2)){
			callback('invalid parameters',null)
		}else{
			callback(null,num1+num2);
		}
	}, 2000);
}

function squareOnServer(num,callback){
	setTimeout(function(){
		if(isNaN(num)){
			callback('invalid parameters',null)
		}else{
			callback(null,num*num);
		}
	}, 1000);
}

addOnServer(5,5,function(err,sum){
	if(err){
		console.log('Error: '+ err);
	}else{
		squareOnServer(sum,function(err,square){
			if(err){
				console.log(err);
			}else{
				console.log(square);
			}
		})
	}
});
//-----------------------------------------------
//callback hell
//http://callbackhell.com/
//-----------------------------------------------
// basic Promise

function addOnServer(num1,num2){
	return new Promise(function(resolve,reject){
		setTimeout(function(){ resolve(num1+num2) }, 3000);
	})
}

addOnServer(8,5).then(num=>{
	console.log(num);
})
//-----------------------------------------------
//handling error

function addOnServer(num1,num2){
	return new Promise(function(resolve,reject){
	setTimeout(function(){
		if(isNaN(num1) || isNaN(num2)){
			reject('invalid parameters')
		}else{
			resolve(num1+num2);
		}
	}, 3000);
	})
}

addOnServer(8,10)
.then(num => { //Fat arrow notation
	console.log(num);
}).catch(function(err){
	console.log('Error : '+err);
})

//-----------------------------------------------
//chaining promises
function addOnServer(num1,num2){
	return new Promise(function(resolve,reject){
	setTimeout(function(){
		if(isNaN(num1) || isNaN(num2)){
			reject('invalid parameters')
		}else{
			resolve(num1+num2);
		}
	}, 1000);
	})
}

function squareOnServer(num){
	return new Promise(function(resolve,reject){
	setTimeout(function(){
		if(isNaN(num)){
			reject('invalid parameters')
		}else{
			resolve(num*num);
		}
	}, 1000);
	})
}

addOnServer(5,5)
.then(num => {
	return squareOnServer(num);
})
.then(square => {
	console.log(square);
})
.catch(function(err){
	console.log('Error : '+err);
})