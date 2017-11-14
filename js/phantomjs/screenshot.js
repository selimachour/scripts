/**
 * Takes a screenshot of a SITE, and stores it under THUMB_LOCATION
 */

var system = require('system');
var args = system.args;

if (args.length !== 3) {
    console.log('Usage: phantomjs screenshot.js URL THUMB_LOCATION');
} else {

    var url = args[1];
    var thumb = args[2];

    console.log('Saving ' + url + ' screenshot into ' + thumb);

    var page = require('webpage').create();
    page.viewportSize = { width: 1024, height: 768 };
    //page.clipRect = { top: 0, left: 0, width: 1024, height: 3768 };
    page.open(url, function(status) {
        if (status === 'success') {
            setTimeout(function() {
                console.log(page.render(thumb));
                phantom.exit();
            }, 500);
        } else {
                phantom.exit();
        }
    });
}

