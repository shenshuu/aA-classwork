const Asteroid = require("./asteroid.js");

const CONSTANTS = {
    DIM_X: 1000,
    DIM_Y: 1000,
    NUM_ASTEROIDS: 5
};

function Game() {
    this.asteroids = [];    
    for (let i = 0; i < CONSTANTS.NUM_ASTEROIDS; i++){
        this.addAsteroids();
    }
};

Game.prototype.randomPosition = function(){
    return [Math.floor(Math.random() * CONSTANTS.DIM_X), Math.floor(Math.random() * CONSTANTS.DIM_Y)]
};


Game.prototype.addAsteroids = function(){
    this.asteroids.push(new Asteroid({game: this, pos: this.randomPosition()}));
};

Game.prototype.draw = function(ctx){
    ctx.clearRect(0, 0, CONSTANTS.DIM_X, CONSTANTS.DIM_Y);
    for (let asteroid of this.asteroids){
        asteroid.draw(ctx);
    }
};

Game.prototype.moveObjects = function() {
    let that = this;
    for (let i = 0; i < this.asteroids.length; i++) {
        this.asteroids[i].move();
    }
};

Game.prototype.wrap = function(pos) {
    [x, y] = [pos[0], pos[1]];
    if (x >= CONSTANTS.DIM_X) pos[0] = 0;
    if (y >= CONSTANTS.DIM_Y) pos[1] = 0;
    if (x < 0) pos[0] = CONSTANTS.DIM_X;
    if (y < 0) pos[1] = CONSTANTS.DIM_Y;
}

Game.prototype.checkCollisions = function() {
    for (let i = 0; i < this.asteroids.length; i++) {
        for (let j = 0; j < this.asteroids.length; j++) {
            if (i !== j) {
                if (this.asteroids[i].isCollidedWith(this.asteroids[j])) {
                    console.log("COLLISION");
                }
            }
        }
    }
}

Game.prototype.step = function() {
    this.moveObjects();
    this.checkCollisions();
}

Game.prototype.remove = function(asteroid) {

}

module.exports = Game;