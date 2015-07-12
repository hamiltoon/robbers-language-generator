gulp 		= require('gulp')
es 			= require('event-stream')

plug = require("gulp-load-plugins")({
	pattern 				: ['gulp-*', 'gulp.*']
	replaceString 	: /\bgulp[\-.]/
})

files = {
	src 	: {
		script : './angular-robbers-language-generator.coffee'
	}
	dest 	: {
		script : './angular-robbers-language-generator.min.js'
	}
}

changeEventLogger = (evt)->
  plug.util.log('File', plug.util.colors.cyan(evt.path.replace(new RegExp('/.*(?=/' + ')/'), '')), 'was', plug.util.colors.magenta(evt.type));


gulp.task 'styles', ()->
	return

gulp.task 'scripts', ()->
	gulp.src files.src.script
		.pipe( plug.coffee({bare: true} ).on( 'error', plug.util.log ))
		.pipe( plug.rename( files.dest.script ))
		.pipe( plug.size() )
		.pipe( gulp.dest('./') )

gulp.task('default', ['styles', 'scripts'])

gulp.task('watch', ['styles', 'scripts'], ()->

  gulp.watch( files.src.script, ['scripts']).on('change', (evt)->
      changeEventLogger(evt)
  )

)
