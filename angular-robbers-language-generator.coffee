'use strict'
angular.module('ngRobbersLanguageGenerator', [] )
.filter( 'robbersLanguageGeneratorFilter', [ ()->
	( textToTranslate )->
		consonants = [ 'b', 'c', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'm', 'n', 'p', 'q', 'r', 's', 't', 'v', 'w', 'x', 'y', 'z', 'å' ]

		ret = ''
		for char in textToTranslate
			if consonants.indexOf(char.toLowerCase()) isnt -1
				ret += char + 'o' + char
			else
				ret += char

		ret

])