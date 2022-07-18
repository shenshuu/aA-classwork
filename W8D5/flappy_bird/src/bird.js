export default class Bird {
    constructor(dimensions) {
        this.dimensions = dimensions;
        this.x = dimensions.width / 3;
        this.y = dimensions.height / 2;
        this.velocity = 0;
    }

    drawBird(ctx) {
        ctx.fillStyle = 'red';
        ctx.fillRect(this.x, this.y, 40, 30);
    }

    animate(ctx) {
        this.move();
        this.drawBird(ctx);
    }

    move() {
        this.y += this.velocity;
        this.velocity += 0.5;
    }

    flap() {
        this.velocity = -8;
    }

}