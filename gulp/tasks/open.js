var gulp = require('gulp');
var open = require("gulp-open");

module.exports = function() {

	var options = {
		url: "http://dev.craft-demo.com",
		app: "google chrome"
	};

  return gulp.src('./index.php')
    .pipe(open('', options));
};
