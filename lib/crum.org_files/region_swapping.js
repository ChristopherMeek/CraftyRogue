// var regions = [ 'north_america', 'europe', 'elsewhere' ];
// 
// function rotate(array) {
//   var item = array.shift();
//   array.push(item);
//   return array;
// }
// 
// function tick() {
//   setTimeout(tock, 4000);
// }
// 
// function tock() {
//   rotate(regions);
//   var next = regions.first();
//   var current = regions.last();
//   new Effect.Fade($(current), {
//     duration: 0.5,
//     afterFinish: function() {
//       new Effect.Appear($(next), {
//         duration: 0.5,
//         afterFinish: tick
//       });
//     }
//   });
// }
// 
// Event.observe(window, 'load', tick);
// 
