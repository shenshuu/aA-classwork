Array.prototype.myEach = function(callback) {
    for (let i = 0; i < this.length; i++) {
        console.log(callback(this[i]));
    }
}

Array.prototype.myMap = function(callback) {
    result = []
    for (let i = 0; i < this.length; i++) {
        result.push(callback(this[i]));
    }
    return result
}

Array.prototype.myReduce = function(callback, acc = this[0]) {
    for (let i = 1; i < this.length; i++) {
        acc = callback(acc, this[i]);
    }
    return acc 
}

function add_one(num) {
    return num + 1;
}

function sum(acc = 0, ele) {
    acc += ele 
    return acc 
}

console.log([1,2,3].myEach(add_one));
console.log([1,2,3].myMap(add_one));
console.log([1,2,3].myReduce(sum));