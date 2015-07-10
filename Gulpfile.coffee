gulp 		= require('gulp')
gutil 	= require('gulp-util')
es = require('event-stream');

plug = require("gulp-load-plugins")({
	pattern 				: ['gulp-*', 'gulp.*']
	replaceString 	: /\bgulp[\-.]/
})

gulp.task 'styles', ()->
	return

gulp.task 'scripts', ()->
	gulp.src './robbers-language-generator.coffee'
		.pipe( plug.coffee({bare: true} ).on( 'error', gutil.log ))
		.pipe( plug.size() )
		.pipe( plug.rename({
			basename: "robbers-language-generator",
			suffix: ".min",
			extname: ".js"
		}))
		.pipe( gulp.dest('./') )

	# gulp.src './src/*.coffee'
	 #  .pipe( coffee({bare: true} ).on( 'error', gutil.log ))
	 #  .pipe( gulp.dest('./public/') )

gulp.task('default', ['styles', 'scripts']);