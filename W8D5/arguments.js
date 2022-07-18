function sum1() {
    let total = 0;
    for(let i = 0; i < arguments.length; i++) { 
        total += arguments[i];
    }
    return total;
}

function sum2(...nums) {
    let total = 0;
    for(let i = 0; i < nums.length; i++) { 
        total += nums[i];
    }
    return total;
}

Function.prototype.myBind1 = function(context) {
    let that = this;
    let bindArgs = Array.from(arguments).slice(1);
    return function boundFnc() {
        let callArgs = Array.from(arguments);
        return that.apply(context, bindArgs.concat(callArgs))
    }
}

Function.prototype.myBind = function(context, ...args) {
    let that = this;
    let bindArgs = args;
    return function boundFnc(...args) {
        let callArgs = args;
        return that.apply(context, bindArgs.concat(callArgs))
    }
}


// console.log(sum2(1, 2, 3, 4)); //=== 10;

class Cat {
    constructor(name) {
      this.name = name;
    }
  
    says(sound, person) {
      console.log(`${this.name} says ${sound} to ${person}!`);
      return true;
    }
  }
  
  class Dog {
    constructor(name) {
      this.name = name;
    }
  }
  
  const markov = new Cat("Markov");
  const pavlov = new Dog("Pavlov");
  
  markov.says("meow", "Ned");
  // Markov says meow to Ned!
  // true
  
  // bind time args are "meow" and "Kush", no call time args
  markov.says.myBind(pavlov, "meow", "Kush")();
  // Pavlov says meow to Kush!
  // true
  
  // no bind time args (other than context), call time args are "meow" and "a tree"
  markov.says.myBind(pavlov)("meow", "a tree");
  // Pavlov says meow to a tree!
  // true
  
  // bind time arg is "meow", call time arg is "Markov"
  markov.says.myBind(pavlov, "meow")("Markov");
  // Pavlov says meow to Markov!
  // true
  
  // no bind time args (other than context), call time args are "meow" and "me"
  const notMarkovSays = markov.says.myBind(pavlov);
  notMarkovSays("meow", "me");
  // Pavlov says meow to me!
  // true
  

function curriedSum(numArgs) {
    let args = [];
    let total = 0;
    return function __curriedSum(num) {
        args.push(num);
        total += num;
        if (args.length === numArgs) {
            return total;
        } else {
            return __curriedSum;
        }
    }
}

Function.prototype.curry2 = function(numArgs) {
    let args = [];
    let that = this;
    return function _curry1(arg) {
        args.push(arg);
        if (args.length === numArgs) {
            return that.apply(null, args)
        } else {
            return _curry1; 
        }
    }
}

Function.prototype.curry1 = function(numArgs) {
    let args = [];
    let that = this;
    return function _curry1(arg) {
        args.push(arg);
        if (args.length === numArgs) {
            return that(...args);
        } else {
            return _curry1; 
        }
    }
}

let sum = curriedSum(3);
console.log(sum(5)(30)(20))

console.log(sum1.curry1(3)(1)(2)(3))