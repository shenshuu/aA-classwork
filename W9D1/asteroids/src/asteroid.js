const MovingObject = require("./moving_object");
const Util = require("./util");

const DEFAULTS = {
    COLOR: 'black',
    RADIUS: 10,
    SPEED: 10,
};


function Asteroid(obj){
    obj ||= {pos: [0, 0]}
    obj.color = DEFAULTS.COLOR;
    obj.radius = DEFAULTS.RADIUS;
    obj.vel = Util.randomVec(DEFAULTS.SPEED);
    MovingObject.call(this, obj);
};
  
Util.inherits(Asteroid, MovingObject);
module.exports = Asteroid;