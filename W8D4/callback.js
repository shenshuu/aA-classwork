class Clock {

    constructor() {
      // 1. Create a Date object.
      // 2. Store the hours, minutes, and seconds.
      // 3. Call printTime.
      // 4. Schedule the tick at 1 second intervals.
      const date = new Date();
      this.hours = date.getHours();
      this.minutes = date.getMinutes();
      this.seconds = date.getSeconds();
      this.printTime();
      setInterval(this._tick.bind(this), 1000); 
    }
  
    printTime() {
      // Format the time in HH:MM:SS
      // Use console.log to print it.
      let h = this.hours;
      let m = this.minutes;
      let s = this.seconds;
      if (h < 10) h = `0${this.hours}`;
      if (m < 10) m = `0${this.minutes}`;
      if (s < 10) s = `0${this.seconds}`;
      console.log(`${h}:${m}:${s}`)
    }
  
    _tick() {
      // 1. Increment the time by one second.
      // 2. Call printTime.
        this.seconds += 1 
        if (this.seconds === 60) {
            this.minutes += 1;
            this.seconds = 0;
        }
        if (this.minutes === 60) {
            this.hours += 1;
            this.minutes = 0;
        }
        if (this.hours === 24) {
            this.hours = 0;
        }
        this.printTime();
    }
  }
  
//   const clock = new Clock();


const readline = require("readline");
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

function addNumbers(sum, numsLeft, completionCallback) {
    if (numsLeft > 0) {
        rl.question("Enter number: ", function(input) {
            sum += parseInt(input);
            console.log(sum);
            return addNumbers(sum, numsLeft-1, completionCallback);
        })
    } else {
        rl.close();
        return completionCallback(sum);
    }
}

// addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));

Function.prototype.myBind = function(context) {
    return () => this.apply(context);
}

class Lamp {
    constructor() {
      this.name = "a lamp";
    }
}
  
const turnOn = function() {
console.log("Turning on " + this.name);
};

const lamp = new Lamp();

// turnOn(); // should not work the way we want it to

const boundTurnOn = turnOn.bind(lamp);
const myBoundTurnOn = turnOn.myBind(lamp);
  
// boundTurnOn(); // should say "Turning on a lamp"
// myBoundTurnOn(); // should say "Turning on a lamp"

function askIfGreaterThan(el1, el2, callback) {
    rl.question(`Is ${el1} > ${el2}? `, function(response) {
        if (response === 'yes') return callback(true);
        else                    return callback(false);
    })
}

function innerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortLoop) {
    if (i < arr.length - 1) {
        askIfGreaterThan(arr[i], arr[i + 1], function(isGreaterThan) {
            if (isGreaterThan) {
                [arr[i], arr[i+1]] = [arr[i+1], arr[i]];
                madeAnySwaps = true;
            }
            return innerBubbleSortLoop(arr, i+1, madeAnySwaps, outerBubbleSortLoop);
        });
    } else return outerBubbleSortLoop(madeAnySwaps);
}

// innerBubbleSortLoop([1,8,3,4], 0, false, () => console.log('in outer bs'));

function absurdBubbleSort(arr, sortCompletionCallback) {
    function outerBubbleSortLoop(madeAnySwaps) {
        if (madeAnySwaps) return innerBubbleSortLoop(arr, 0, false, outerBubbleSortLoop);
        else return sortCompletionCallback(arr);
    }
    outerBubbleSortLoop(true);
}

// absurdBubbleSort([3, 2, 1], function(arr) {
//     console.log("Sorted array: " + JSON.stringify(arr));
//     reader.close();
//   });

Function.prototype.myThrottle = function (interval) {
    let tooSoon = false;
    const that = this;

    return function() {
        if (!tooSoon) {
            tooSoon = true;
            setTimeout(() => tooSoon = false, interval);
            return that(...arguments);
        }
    }
}

class Neuron {
    fire() {
      console.log("Firing!");
    }
  }
  
  const neuron = new Neuron();
  // When we create a new Neuron,
  // we can call #fire as frequently as we want
  
  // The following code will try to #fire the neuron every 10ms. Try it in the console:
//   const interval = setInterval(() => {
//     neuron.fire();
//   }, 10);
  
//   // You can use clearInterval to stop the firing:
//   clearInterval(interval);
  
  // Using Function#myThrottle, we should be able to throttle
  // the #fire function of our neuron so that it can only fire
  // once every 500ms:
  
//   neuron.fire = neuron.fire.myThrottle(500);
  
//   const interval = setInterval(() => {
//     neuron.fire();
//   }, 10);
  
//   // This time, if our Function#myThrottle worked correctly,
//   // the Neuron#fire function should only be able to execute
//   // every 500ms, even though we're still trying to invoke it
//   // every 10ms!
  
//   // If we want this behavior for ALL neurons, we can do the same logic in the constructor:
  
//   class Neuron {
//     constructor() {
//       this.fire = this.fire.myThrottle(500);
//     }
  
//     fire() {
//       console.log("Firing!");
//     }
//   }

Function.prototype.myDebounce = function (interval) {
    let debounceTimer = interval;
    const that = this;

    return function() {
        this.clearTimeout(debounceTimer);
        debounceTimer = this.setTimeout(that, interval);
    }
}

class SearchBar {
    constructor() {
      this.query = "";
  
      this.type = this.type.bind(this);
      this.search = this.search.bind(this);
    }
  
    type(letter) {
      this.query += letter;
      this.search();
    }
  
    search() {
      console.log(`searching for ${this.query}`);
    }
  }

const searchBar = new SearchBar();

const queryForHelloWorld = () => {
  searchBar.type("h");
  searchBar.type("e");
  searchBar.type("l");
  searchBar.type("l");
  searchBar.type("o");
  searchBar.type(" ");
  searchBar.type("w");
  searchBar.type("o");
  searchBar.type("r");
  searchBar.type("l");
  searchBar.type("d");
};

queryForHelloWorld();

// Assign searchBar.search to the returned debounced version
searchBar.search = searchBar.search.myDebounce(1000);
searchBar.search = searchBar.search.myDebounce(1000);
