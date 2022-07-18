
const MovingObject = require("./moving_object.js");
const Util = require("./util.js");
const Asteroid = require("./asteroid.js");
const Game = require("./game.js");
const GameView = require("./game_view.js")
window.addEventListener('DOMContentLoaded', (event) => {
  const canvas = document.getElementById('game-canvas')
  const ctx = canvas.getContext('2d');
  

  const gameView = new GameView(new Game(), ctx);
  gameView.start();
});