var gulp = require('./gulp')([
	'styles',
	'open',
  'templates',
	'watch'
]);

gulp.task('build', ['styles', 'templates']);
gulp.task('default', ['build', 'watch', 'open']);
