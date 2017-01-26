// In this file you can include the rest of your app's specific main process
// code. You can also put them in separate files and require them here.


require('./index.html');
var Elm = require('./Main');

var elm = Elm.Main.fullscreen({
  swapCount: 0
});

//interop
elm.ports.alert.subscribe(function(message) {
  alert(message);
  elm.ports.log.send('Alert called: ' + message);
});

//elm-hot callback
elm.hot.subscribe(function (event, context) {
  console.log('elm-hot event:', event)
  context.state.swapCount ++
})
