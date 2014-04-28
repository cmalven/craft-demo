var gulp       = require('gulp');
var livereload = require('gulp-livereload');

module.exports = function(){
	gulp.watch('styles/**/*.scss', ['styles']);
  gulp.watch('craft/templates/**/*', ['templates']);
	livereload();
};
