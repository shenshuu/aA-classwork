function MovingObject(options) {
    this.game = options.game;
    this.pos = options.pos;
    this.vel = options.vel;
    this.radius = options.radius;
    this.color = options.color;
};

MovingObject.prototype.draw = function(ctx) {
    ctx.fillStyle = this.color;
    ctx.beginPath();
    ctx.arc(this.pos[0], this.pos[1], this.radius, 0, 2*Math.PI);
    ctx.fill();
}

MovingObject.prototype.move = function() {
    this.pos[0] += this.vel[0];
    this.pos[1] += this.vel[1];
    this.game.wrap(this.pos);
}

MovingObject.prototype.isCollidedWith = function(otherObject) {
    
    let that = otherObject;
    [x0, y0, x1, y1] = [this.pos[0], this.pos[1], that.pos[0], that.pos[1]];
    let distance = Math.sqrt((x0 - x1) * (x0 - x1) + (y0 - y1) * (y0 - y1));
    return distance <= this.radius + that.radius 
}

module.exports = MovingObject;

