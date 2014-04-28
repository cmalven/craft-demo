var ruby_sass  = require('gulp-ruby-sass');
var prefixer   = require('gulp-autoprefixer');
var gulp       = require('gulp');
var livereload = require('gulp-livereload');
var notify     = require('gulp-notify');

module.exports = function() {
  return gulp.src('styles/main.scss')
    .pipe(ruby_sass({
      style: 'compressed',
      loadPath: ['styles']
    }))
    .on('error', notify.onError({
      message: "<%= error.message %>",
      title: "SASS Error"
    }))
    .pipe(prefixer('last 1 version'))
    .on('error', notify.onError({
      message: "<%= error.message %>",
      title: "AutoPrefixer Error"
    }))
    .pipe(gulp.dest('styles'))
    .pipe(livereload());
};
