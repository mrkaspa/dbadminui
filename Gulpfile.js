var gulp = require('gulp');
var sass = require('gulp-sass');

gulp.task('styles', function() {
  gulp.src('src/styles/app.sass')
  .pipe(sass({indentedSyntax: true, outputStyle: 'compressed'}).on('error', sass.logError))
  .pipe(gulp.dest('./src/assets/'));
});

//Watch task
gulp.task('default',function() {
    gulp.watch('src/styles/*/**.sass', ['styles']);
    gulp.watch('src/styles/*.sass', ['styles']);
});
