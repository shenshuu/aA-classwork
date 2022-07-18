require("./game.js")

function GameView(game, ctx){
    this.game = game;
    this.ctx = ctx;
};

GameView.prototype.start = function() {
    const that = this;
    setInterval(function(){
        that.game.moveObjects();
        that.game.draw(that.ctx);
    }, 20);
};

module.exports = GameView;