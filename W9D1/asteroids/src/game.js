const Asteroid = require("./asteroid.js");

const CONSTANTS = {
    DIM_X: 1000,
    DIM_Y: 1000,
    NUM_ASTEROIDS: 30
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
    this.asteroids.push(new Asteroid({pos: this.randomPosition()}));
};

Game.prototype.draw = function(ctx){
    ctx.clearRect(0, 0, CONSTANTS.DIM_X, CONSTANTS.DIM_Y);
    for (let asteroid of this.asteroids){
        asteroid.draw(ctx);
    }
};

Game.prototype.moveObjects = function() {
    for (let i = 0; i < this.asteroids.length; i++) {
        this.asteroids[i].move();
    }
};

module.exports = Game;