'use strict'
angular.module('ngRobbersLanguageGenerator', [] )
.constant('robbersLanguageGeneratorConfig',
	vow	 	: 'o'
)
.filter( 'robbersLanguageGeneratorFilter', [ 
	'robbersLanguageGeneratorConfig'
	( config )->
		( textToTranslate, vow = undefined )->

			selectedVow = vow or config.vow
			
			consonants = [ 'b', 'c', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'm', 'n', 'p', 'q', 'r', 's', 't', 'v', 'w', 'x', 'y', 'z', 'å' ]

			ret = ''
			for char in textToTranslate
				 
				# Checks if the corrent character (in lowercase) is in the array
				if consonants.indexOf( char.toLowerCase() ) isnt -1

					# Adds the selected vow to aside of the current char
					ret += [ char, selectedVow, char.toLowerCase()].join('')
				
				else
					ret += char

			ret

])