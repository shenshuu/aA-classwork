const MovingObject = require("./moving_object.js");
const Util = require("./util.js");
window.MovingObject = MovingObject;
const mo = new MovingObject({
    pos: [30, 30],
    vel: [10, 10],
    radius: 5,
    color: "red"
  });

function Dummy() {}

Util.inherits(Dummy, MovingObject);
const dummy = new Dummy()
console.log(dummy);
mo.draw(mo);
mo.move()
console.log(mo.pos);