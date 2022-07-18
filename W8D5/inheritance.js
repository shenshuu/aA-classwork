function Surrogate() {}

Function.prototype.inherits = function(superClass) {
    // Surrogate.prototype = superClass.prototype;
    // this.prototype = new Surrogate();
    // this.prototype.constructor = this;
    this.prototype = Object.create(superClass.prototype)
}

function MovingObject () {}

function Ship(name) {
    this.name = name;
}
Ship.inherits(MovingObject);

function Asteroid () {}
Asteroid.inherits(MovingObject);

MovingObject.prototype.move = function() {
    console.log("moved!");
}

Ship.prototype.honk = function() {
    console.log("HONK");
}

let asteroid = new Asteroid();
let ship = new Ship("Titanic")

asteroid.honk(); 
ship.honk();