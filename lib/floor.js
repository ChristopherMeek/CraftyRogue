// Generated by CoffeeScript 1.6.1
(function() {

  define(['crafty'], function(crafty) {
    return crafty.c('Floor', {
      init: function() {
        this.requires('2D, Canvas, Image, Tile');
        return this.image('assets/Dirt Block.png');
      }
    });
  });

}).call(this);
